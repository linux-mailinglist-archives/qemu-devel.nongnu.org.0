Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6525BAB8D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 12:45:22 +0200 (CEST)
Received: from localhost ([::1]:51840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ8qX-00021m-ES
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 06:45:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oZ8ol-000094-EL
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 06:43:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oZ8oi-0004iQ-4E
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 06:43:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663325003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1mqGIR/EQd+53euqi4qJ7DosYEoxngmhX73BrVJ68do=;
 b=doRywMPHmgFjoHCK8ECP/8BnegKh6RzCb2q1uHkPzLMefhoVqgdj1CMn9vvzH+tkzkJriD
 rAIZf8tmn5RDL7RPB8kX8SYWMd+y+Me5MjOBqHGygdSFST0iqaVs1QpsEzWYwNoC/s7ZXS
 pITAAIxdvFLXVPzdrD2IUkKW3eKMt9E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-p12M25zEMoylbAe4qE2Ggg-1; Fri, 16 Sep 2022 06:43:18 -0400
X-MC-Unique: p12M25zEMoylbAe4qE2Ggg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0966B2A5955A;
 Fri, 16 Sep 2022 10:43:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 29E5910EB8;
 Fri, 16 Sep 2022 10:43:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0D6EF21E6900; Fri, 16 Sep 2022 12:43:16 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <f4bug@amsat.org>,  Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,  Volker =?utf-8?Q?R=C3=BCmelin?=
 <vr_qemu@t-online.de>,  qemu-devel@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>,  Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v3] audio: add help option for -audio and -audiodev
References: <20220908081441.7111-1-cfontana@suse.de>
Date: Fri, 16 Sep 2022 12:43:16 +0200
In-Reply-To: <20220908081441.7111-1-cfontana@suse.de> (Claudio Fontana's
 message of "Thu, 8 Sep 2022 10:14:41 +0200")
Message-ID: <877d23d2gr.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Has this fallen through the cracks?


