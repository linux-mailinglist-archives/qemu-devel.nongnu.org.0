Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C37866A48AF
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 18:56:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWhjB-0003gT-Fg; Mon, 27 Feb 2023 12:56:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWhj9-0003ey-PW
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:55:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWhj8-0004QN-FC
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:55:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677520553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G/LJJSDSe2pc4cGWYO9l+tEYdT1ooIPzyRhC6E52H9Y=;
 b=RDW6KWXZbM9vYMDP/bFjoxlvde8ixsvzKIkoSi4GZPfUngBNv7IOcyMwWJJi05KU3zkjXA
 cXLijAqUaoiLTG1c3Jf+8xYiIEKXOVPvaoTGeLaKXkCT1+GYRimgLfXpYSUU/8xlljKxhM
 ivVwGT+Q4YAV0VJPlWfxbNqZkiVjFwc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-637-jCkH22I4PzaVE6c5MoI17w-1; Mon, 27 Feb 2023 12:55:52 -0500
X-MC-Unique: jCkH22I4PzaVE6c5MoI17w-1
Received: by mail-ed1-f70.google.com with SMTP id
 co14-20020a0564020c0e00b004aab4319cedso9677227edb.2
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 09:55:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G/LJJSDSe2pc4cGWYO9l+tEYdT1ooIPzyRhC6E52H9Y=;
 b=H3LLsq6rNR5Uzta6JF8474NZW4Jb+KJ7BBoOeT03VazQZCCL2tit2ziNmYAMzlbu4c
 Ycem8nEvhcLdNo5Mq8/weyqeeyLMgFjYY95cMzVUX0j+5y4aztiQoOhrwReLpX30Pin0
 NnMJFiX1Ej9HXVlAKgD8RWb+GzEOW8lqbv50YK/UVRiK3sBN+YgsoJv91V9wbTxDtRbk
 e962Ey1/VSDJqTBi1Cx6G23QE+SbGn4mpG+sRsXBMGvkzXEkRbsShctxzKkEqF79NLvM
 /dA6PZ/y1XCkKTxKKoeN2DYxH9gsYQYBndBbgqiR89SvNlJQRoDhVfUtDhRzjMkJnEpK
 YbPg==
X-Gm-Message-State: AO0yUKVCck13twlWUsnBe/dARFWRQqYSCJcKyf0x44/UZTbTewX9LJSh
 abfoB+Gx8NPhv7rrQ5lxAGbY4zOHRi2G008pwp1R+iW5FSGpokK+nxm6EVJVPs/B22fQgW24IUK
 C5qa/gJVEcmfWi/salCdY2AuOcRahWerRToTq7T0LSipkE+EMfun7OQtr+MtmaK6jExiHK5dg
X-Received: by 2002:a05:6402:845:b0:4a3:43c1:8431 with SMTP id
 b5-20020a056402084500b004a343c18431mr11046252edz.5.1677520550926; 
 Mon, 27 Feb 2023 09:55:50 -0800 (PST)
X-Google-Smtp-Source: AK7set9AIU2u09Jp2kgSWzTtfSmezx5ZXeOu1plRPVzpclwP+J6cQb2pT1OMaD/Z1IxLjkMll+OqzA==
X-Received: by 2002:a05:6402:845:b0:4a3:43c1:8431 with SMTP id
 b5-20020a056402084500b004a343c18431mr11046237edz.5.1677520550679; 
 Mon, 27 Feb 2023 09:55:50 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 e28-20020a50a69c000000b004ad1d3cf195sm3411710edc.95.2023.02.27.09.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 09:55:50 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 09/13] MAINTAINERS: Cover RCU documentation
Date: Mon, 27 Feb 2023 18:55:20 +0100
Message-Id: <20230227175524.710880-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230227175524.710880-1-pbonzini@redhat.com>
References: <20230227175524.710880-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index eb917e48c0ab..896e411918c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2812,6 +2812,8 @@ F: qapi/run-state.json
 Read, Copy, Update (RCU)
 M: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
+F: docs/devel/lockcnt.txt
+F: docs/devel/rcu.txt
 F: include/qemu/rcu*.h
 F: tests/unit/rcutorture.c
 F: tests/unit/test-rcu-*.c
-- 
2.39.1


