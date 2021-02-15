Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 520AB31B9B9
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:50:57 +0100 (CET)
Received: from localhost ([::1]:57296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBdL6-0008Fm-9g
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:50:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lBdEY-0002zr-TE
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:44:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lBdEW-0000Av-Mf
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:44:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613393044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RS4W56Abh2E8vblMlEDaQ1wdUwZZxfmtVM+AJ2IQINk=;
 b=iR7MXRH0MMxwZQMsbSDLObF+uEwH16ke1lV+WTJASKdY98+Z1olqBO5hLzDgNPsJSRBce1
 P1b3tTaIuMxzSrR5eR0Qu1UgbqhAP3MFGiyeE6sntu1iYAhO0S6gRb4H/kacmUPpsYg6lD
 8qq9icaozEBT6OXw13sHUJL/60KnDuE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-ybvI32KzOOCqMavW2_z9eg-1; Mon, 15 Feb 2021 07:44:03 -0500
X-MC-Unique: ybvI32KzOOCqMavW2_z9eg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 274E7AFA81
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 12:44:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-100.ams2.redhat.com
 [10.36.114.100])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEB9319CAB;
 Mon, 15 Feb 2021 12:44:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 88FEF113865F; Mon, 15 Feb 2021 13:44:00 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 0/2] monitor: Shutdown fixes
References: <20210212172028.288825-1-kwolf@redhat.com>
Date: Mon, 15 Feb 2021 13:44:00 +0100
In-Reply-To: <20210212172028.288825-1-kwolf@redhat.com> (Kevin Wolf's message
 of "Fri, 12 Feb 2021 18:20:26 +0100")
Message-ID: <87ft1xxzzj.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> This fixes the bug(s) that Markus reported here:
> https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg07719.html

Mostly thanks to the helpful commit messages and code comments:
Reviewed-by: Markus Armbruster <armbru@redhat.com>


