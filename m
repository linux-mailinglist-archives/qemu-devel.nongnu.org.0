Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C492B293527
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 08:46:32 +0200 (CEST)
Received: from localhost ([::1]:59530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUlPj-0005I7-Ra
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 02:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kUlN4-0003NW-Lx
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 02:43:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kUlMx-0003Ut-RR
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 02:43:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603176213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R4jEHvIvoM75qhL8seV1ZdJ/dmZyrzsk21S+XyG3qCc=;
 b=DBIIoJf1WxXIJ6Lxtq8oFm3r3sihCiT2UP/ut9y2W162b8ooQZPNM5X8+M5XD0k4I1y30O
 shF/hxHwWT/3fAfi7hPvqWSzWsvWyLDhfNpAhsPG+Tpze5VwmtsjTooM1gHLaW1KE8jsdM
 tUsdzpr2FPMlPux908C4/IbNjTM4Vq0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-DdAsJ-P1MG2VwpSaJysG-A-1; Tue, 20 Oct 2020 02:43:31 -0400
X-MC-Unique: DdAsJ-P1MG2VwpSaJysG-A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 093C88030C4;
 Tue, 20 Oct 2020 06:43:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B398860DA0;
 Tue, 20 Oct 2020 06:43:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1FB101132A08; Tue, 20 Oct 2020 08:43:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: David Edmondson <david.edmondson@oracle.com>
Subject: Re: [PATCH] qmp-shell: Sort by key when pretty-printing
References: <20201013141414.18398-1-david.edmondson@oracle.com>
Date: Tue, 20 Oct 2020 08:43:28 +0200
In-Reply-To: <20201013141414.18398-1-david.edmondson@oracle.com> (David
 Edmondson's message of "Tue, 13 Oct 2020 15:14:14 +0100")
Message-ID: <87wnzlz9bj.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:16:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Edmondson <david.edmondson@oracle.com> writes:

> If the user selects pretty-printing (-p) the contents of any
> dictionaries in the output are sorted by key.
>
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> ---
>  scripts/qmp/qmp-shell | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
> index c5eef06f3f..b4d06096ab 100755
> --- a/scripts/qmp/qmp-shell
> +++ b/scripts/qmp/qmp-shell
> @@ -260,7 +260,7 @@ class QMPShell(qmp.QEMUMonitorProtocol):
>          indent = None
>          if self._pretty:
>              indent = 4
> -        jsobj = json.dumps(qmp, indent=indent)
> +        jsobj = json.dumps(qmp, indent=indent, sort_keys=self._pretty)
>          print(str(jsobj))
>  
>      def _execute_cmd(self, cmdline):

Queued, thanks!


