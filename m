Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB757466167
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 11:28:37 +0100 (CET)
Received: from localhost ([::1]:39768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msjKO-0007P6-Cw
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 05:28:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1msjIb-0005pY-5C
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 05:26:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1msjIY-00014S-FM
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 05:26:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638440801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c+GTvCoLmbV4SsblBzQS4z19+pf3iwMrH3imDoMD4Ds=;
 b=L3C/7/Xuf5n0skRafJqEpcAWc/Udp1vEHxniWyv6i9rLitqcLcmTEVG6eoULnkNbqXJc2U
 AHJY3QmxsiiaG2AzMiQ1GdmnCNNHxqkS9/FO8Z9xKq5EXB+AxtX9wG6cYuWEFPOFDx7gMw
 NQOilFUAVNB5bVZ5GB0gzYxdT36jyY4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-RcsNmgedPvauIFgmyqZITw-1; Thu, 02 Dec 2021 05:26:38 -0500
X-MC-Unique: RcsNmgedPvauIFgmyqZITw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A091C84B9A2;
 Thu,  2 Dec 2021 10:26:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AC7F60C05;
 Thu,  2 Dec 2021 10:26:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E0C22113865F; Thu,  2 Dec 2021 11:26:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH RFC 00/11] vl: Explore redesign of startup
References: <20211202070450.264743-1-armbru@redhat.com>
Date: Thu, 02 Dec 2021 11:26:21 +0100
In-Reply-To: <20211202070450.264743-1-armbru@redhat.com> (Markus Armbruster's
 message of "Thu, 2 Dec 2021 08:04:39 +0100")
Message-ID: <87czmfb8vm.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: damien.hedde@greensocs.com, berrange@redhat.com, edgar.iglesias@gmail.com,
 mark.burton@greensocs.com, mirela.grujic@greensocs.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I fat-fingered Edgar's e-mail address.  Sorry for the inconvenience.


