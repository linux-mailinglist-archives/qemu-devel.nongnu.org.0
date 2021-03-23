Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38533346B0D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 22:27:07 +0100 (CET)
Received: from localhost ([::1]:54188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOoYH-0005vS-2t
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 17:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOoW9-0003CO-VV
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:24:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOoVu-00051b-LD
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:24:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616534673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PGc2btYnhlCqhvYhCg2k0+5i658IIAcqmzVzLshcMME=;
 b=Bek/jOdAaQIqEH5EcL0bIUcqclcSvZ7n8g0JUYIpa59k2k3JAXoTpeVLrV+bdkaI8u2EtY
 VOySrKlMwxSGnY7X6C6BcDT8zKmdz/bRXkllTgoe87TTFWNSvyQkFEXYFzf4/DulCwWvai
 KZd+Sx4kedrbX3bqUIFjIm55gRBTuMs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-xD4Y4UVVPvuGLtR9BkNv1g-1; Tue, 23 Mar 2021 17:24:31 -0400
X-MC-Unique: xD4Y4UVVPvuGLtR9BkNv1g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78237180FCAC;
 Tue, 23 Mar 2021 21:24:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BAF31002D71;
 Tue, 23 Mar 2021 21:24:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9D74911327E1; Tue, 23 Mar 2021 22:24:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 28/28] qapi: Enforce union and alternate branch naming
 rules
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-29-armbru@redhat.com>
 <7e3a5535-1ac5-df55-1f0e-e7a134f6fbcf@redhat.com>
Date: Tue, 23 Mar 2021 22:24:25 +0100
In-Reply-To: <7e3a5535-1ac5-df55-1f0e-e7a134f6fbcf@redhat.com> (Eric Blake's
 message of "Tue, 23 Mar 2021 11:05:05 -0500")
Message-ID: <87eeg5lg1i.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: michael.roth@amd.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On 3/23/21 4:40 AM, Markus Armbruster wrote:
>> Union branche names should use '-', not '_'.  Enforce this.  The only
>
> branch

Fixing...

>> offenders are in tests/.  Fix them.
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!


