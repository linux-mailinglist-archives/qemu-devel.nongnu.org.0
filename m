Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B62071004C7
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Nov 2019 12:54:49 +0100 (CET)
Received: from localhost ([::1]:32876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWfcF-000611-Qe
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 06:54:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53690)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iWfbT-0005SP-5w
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 06:54:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iWfbR-00069S-AF
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 06:53:58 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:37861
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iWfbQ-000691-V0
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 06:53:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574078036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y9ZmalNB/RJcsvNgVBp2Fa5f3vJvDMWorkbxTRbHuHM=;
 b=T3KCC8GqnrnQ2usM42wt/p/TqNPkjVYbxV4lv8iTeY9igdr+03RwaL7H0HeDfvaT62Ub1R
 Iw6ySmVXQ4oJWX+ciWM50pjOJbOKrvB2UW3jtag6r8fqpTK1Eo/94XxxkkqbOFzail51tF
 CTAyDOqNcXKZxLJF9q5PtIKm2RgCl/g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-8nF1YoV3NzK-iq2g-MP3qg-1; Mon, 18 Nov 2019 06:53:54 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D01A95F9
 for <qemu-devel@nongnu.org>; Mon, 18 Nov 2019 11:53:52 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-200.ams2.redhat.com
 [10.36.116.200])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 16F304B5;
 Mon, 18 Nov 2019 11:53:51 +0000 (UTC)
Subject: Re: [PATCH 04/16] vl: move icount configuration earlier
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1573655945-14912-1-git-send-email-pbonzini@redhat.com>
 <1573655945-14912-5-git-send-email-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <fe69926d-e9cb-2efc-819f-19d7a2f2baf6@redhat.com>
Date: Mon, 18 Nov 2019 12:53:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <1573655945-14912-5-git-send-email-pbonzini@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 8nF1YoV3NzK-iq2g-MP3qg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/11/2019 15.38, Paolo Bonzini wrote:
> Once qemu_tcg_configure is turned into a QOM property setter, it will not
> be able to set a default value for mttcg_enabled.  Setting the default wi=
ll
> move to the TCG init_machine method, which currently runs after "-icount"
> is processed.
>=20
> However, it is harmless to do configure_icount for all accelerators; we w=
ill
> just fail later if a non-TCG accelerator being selected.  So do that.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  vl.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


