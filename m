Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D2D5BED55
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 21:08:37 +0200 (CEST)
Received: from localhost ([::1]:38030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaibk-0003dt-TU
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 15:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oaenT-0003rJ-68
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:04:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oaenP-0003w2-Np
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:04:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663686262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SqC/w0gT90gltZ8o/9mjlJ+Ihzc131foYM8DjKVo9Fc=;
 b=G/iEVheVMgGVBjtVwN4LUsQkONzKzYgab0ZYfoHoiRHdFs3y2m6icRmVAOis8904lSG/hV
 Di/L8W/R0n5fdthKDVS8PEVW1UJEtFq3kl2s8BcEG+2jdtKRS+QAWKQoP4M+otQOFfk0fs
 YQi5FNFLcf15gRIz1M+C7CA6rB6hbys=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-9g3U59EmMtOBxK-He1ZvtQ-1; Tue, 20 Sep 2022 11:04:18 -0400
X-MC-Unique: 9g3U59EmMtOBxK-He1ZvtQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E9FF382C96E;
 Tue, 20 Sep 2022 15:04:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BE0340C2064;
 Tue, 20 Sep 2022 15:04:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 61D4D21E6900; Tue, 20 Sep 2022 17:04:16 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: qemu-devel@nongnu.org,  Dongwon Kim <dongwon.kim@intel.com>,  Gerd
 Hoffmann <kraxel@redhat.com>,  Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  =?utf-8?Q?Ma?=
 =?utf-8?Q?rc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v1 0/3] ui/gtk: Add a new parameter to assign
 connectors/monitors to Guests' windows
References: <20220917000731.465003-1-vivek.kasireddy@intel.com>
Date: Tue, 20 Sep 2022 17:04:16 +0200
In-Reply-To: <20220917000731.465003-1-vivek.kasireddy@intel.com> (Vivek
 Kasireddy's message of "Fri, 16 Sep 2022 17:07:28 -0700")
Message-ID: <87a66uhytr.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Any overlap with Dongwon Kim's "[PATCH v5 0/2] handling guest multiple
displays"?

Message-Id: <20220718233009.18780-1-dongwon.kim@intel.com>
https://lists.nongnu.org/archive/html/qemu-devel/2022-07/msg03212.html


