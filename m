Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED26A5B518A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 00:28:58 +0200 (CEST)
Received: from localhost ([::1]:36974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXVRh-0000gU-Bn
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 18:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXVPX-0005sP-OO
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 18:26:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXVPU-00027R-GT
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 18:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662935197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=g2jZgWVe7FbQeMUIYFdkKjpPasutTrLC/abr03O+oVQ=;
 b=dY6w4C6PvY09yL70CMbd7v6X0gWhFNTMjo79jn1J9zvcAb8lGbJY4fUOKKPuIikFSP6dNA
 Dycuz85c2i1gbTkUuO+ujhrKmbcqC60p+/QjFrfORWI0VMhJzyw2P1wH23GasfWIDY1E5O
 bsROKmny0fQmGU6lsFA6HStfLR99Akc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-583-YZJwms7AMQykVzUMbfyATA-1; Sun, 11 Sep 2022 18:26:36 -0400
X-MC-Unique: YZJwms7AMQykVzUMbfyATA-1
Received: by mail-ed1-f69.google.com with SMTP id
 q32-20020a05640224a000b004462f105fa9so4889413eda.4
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 15:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=g2jZgWVe7FbQeMUIYFdkKjpPasutTrLC/abr03O+oVQ=;
 b=Gi/sFwljuUpShUG5F8dtVUemthurd81z7R8v5wm/FGeDpiIDuZYjHcoikT7gdqbvRu
 V2tTV8aAh0AROArmxgCZL6ABRpjK5MHfYurF/rrOTnwPVY+iAJl5M31vl+4h1/eFvyhb
 NJ10REUrzG6kuI2H48uNUWCz+P54aLr2EncR9V/mSSuEHWJeXCRW/JMfABfejqScIAbE
 8CAud214tzSfnEWARott9xNt16bFDcPPTYf9sGpQqENi797G9veSPBTnDQ5cp0ok6Zi1
 PQ0AJm0pga5AXeRaInpH1/cxG5mTTSHsv4/0vxaA6eNzC2INu/ZFy3aCe0QocQNUm6At
 ZxTQ==
X-Gm-Message-State: ACgBeo1RLK72UqsmijG+fgHf4T0a7T5Z59u/Zt1iaEqucXfEQKvTI3es
 Qqk5dAMC4vSV5pTNV6vEodCOhRAG5fdi0VoJMGR4lmsSCR/yhZZp/58ITXS7Yv0/pHfLnQcBHw8
 wvGx30Mwxm9rGTQp6Q4MckLoHxvT9+K1gKyn6BWGswSg6sxjsSOtvvJadMaGZ5KQ7Q1k=
X-Received: by 2002:a17:906:9b8f:b0:77b:2b61:ae2d with SMTP id
 dd15-20020a1709069b8f00b0077b2b61ae2dmr5580241ejc.50.1662935195252; 
 Sun, 11 Sep 2022 15:26:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4lb+FSLYt0ExxWHJ7jd5d5/z4eoSPxmdoNT28kDQnTurYAAoKklWYmkGrdTaGBl0ybv7D6jA==
X-Received: by 2002:a17:906:9b8f:b0:77b:2b61:ae2d with SMTP id
 dd15-20020a1709069b8f00b0077b2b61ae2dmr5580225ejc.50.1662935194908; 
 Sun, 11 Sep 2022 15:26:34 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 ku5-20020a170907788500b00773f3cb67ffsm3467023ejc.28.2022.09.11.15.26.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 15:26:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/i386: two fixes for cmpxchg
Date: Mon, 12 Sep 2022 00:26:28 +0200
Message-Id: <20220911222630.338330-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The first was found by test-x86_64, the second by inspection.  I will
shortly work on adding golden output for the tests in tests/tcg/i386,
so that we check more than "QEMU does not crash".

Paolo


Paolo Bonzini (2):
  target/i386: fix cmpxchg with 32-bit register destination
  target/i386: cmpxchg only overwrites ZF

 target/i386/tcg/translate.c | 83 +++++++++++++++++++++++++------------
 1 file changed, 57 insertions(+), 26 deletions(-)

-- 
2.37.2


