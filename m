Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 865A52099F4
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 08:44:11 +0200 (CEST)
Received: from localhost ([::1]:37836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joLcI-0005jk-4Y
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 02:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1joLbD-0005FB-48
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 02:43:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22952
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1joLbA-0001fe-NU
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 02:43:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593067375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7S7kxJwq4RElFZLBZrRLOpZ8wTsCUHuOGk5p2S5SbLw=;
 b=Nr0lsZRSMn+QoydXkN/mIXvB6/54pRiaJ6Bq+05KlF3OdP4H0ItT+S0IuD67Ahv9qT5/KW
 FK0Ke4LfCTMWrTYZIpYVBRsxgaRCodZiTD8S+EzlQzsLzquWOFzQqFr3tZWoFRLJFjeshV
 ru1oQPHm2D+AwiISAHZ3ptef3X4Zr9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-Z5hFrls2PVysa3zSWG3FUQ-1; Thu, 25 Jun 2020 02:42:54 -0400
X-MC-Unique: Z5hFrls2PVysa3zSWG3FUQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B112107B7C4;
 Thu, 25 Jun 2020 06:42:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA5EC7FD0E;
 Thu, 25 Jun 2020 06:42:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 44F9A11384D4; Thu, 25 Jun 2020 08:42:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2 03/25] Clean up some calls to ignore Error objects the
 right way
References: <20200624083737.3086768-1-armbru@redhat.com>
 <20200624083737.3086768-4-armbru@redhat.com>
 <20200624110227.054838a4@bahia.lan>
Date: Thu, 25 Jun 2020 08:42:51 +0200
In-Reply-To: <20200624110227.054838a4@bahia.lan> (Greg Kurz's message of "Wed, 
 24 Jun 2020 11:02:27 +0200")
Message-ID: <87366j4pec.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 00:45:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Jerome Forissier <jerome@forissier.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Greg Kurz <groug@kaod.org> writes:

> On Wed, 24 Jun 2020 10:37:15 +0200
> Markus Armbruster <armbru@redhat.com> wrote:
>
>> Receiving the error in a local variable only to free it is less clear
>> (and also less efficient) than passing NULL.  Clean up.
>> 
>> Cc: Daniel P. Berrange <berrange@redhat.com>
>> Cc: Jerome Forissier <jerome@forissier.org>
>> CC: Greg Kurz <groug@kaod.org>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>
> It doesn't seem to be different from v1, so:

I missed your reply to v1.  My apologies!

> Reviewed-by: Greg Kurz <groug@kaod.org>
>
> and
>
> Acked-by: Greg Kurz <groug@kaod.org> # for 9pfs

Thanks!


