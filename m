Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52357650941
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 10:19:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7CJ0-0007tz-Tn; Mon, 19 Dec 2022 04:19:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p7CIx-0007r4-RF
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 04:19:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p7CIw-00057Y-CH
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 04:19:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671441565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=SStMxMa1DzkVKVdYdjH0BSj2WCjdqo017RPuw35oE1rvLk5zV1LmlzX1XgIJOql7OF7rE9
 9ukrt/MHD8XKd93ZyxddqDLElFAV17/Fc4jHkreUnw7iWE/tTLMF2wNF50Yrk2Nv9Bzqz2
 lt9uNOHZd3vmrwhvXU8HpUJSX4yWn0I=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-436-7phI6-RYNjCixraYDvAAGg-1; Mon, 19 Dec 2022 04:19:21 -0500
X-MC-Unique: 7phI6-RYNjCixraYDvAAGg-1
Received: by mail-ed1-f69.google.com with SMTP id
 w20-20020a056402269400b004700a51c202so6119128edd.13
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 01:19:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=O2GV8r04g8Fv0rXIXRTobgy6q3I0ojVf5T9bWEzcfDaWvyQOuUGCU2XFXWSv7vbdnE
 R84IRYRWTB8VNgyYzdwMfacuIMh5U21DAtt7baX8y3nt+GB3cbgq0Mk43pIG9FaRaS+8
 HkE3doj66uNmMZL/P1nFsvIep6snFzM91qwbaZUVUxGu8BO0WDgwIMD6F+CRydOWdDvB
 hEI05vSfKjIzXmcLo09LBcLdLLhXjnKXkOaGPZ8FnLIJDIDpW5bDk2WBnkVQL9EHLGB2
 uXlHSYmDjEjgAyRaEn3z1dgS0u9YvomcY1KprglvcvqVKL9gZjJygK+hPuBWEqAJ6Oqa
 MwHg==
X-Gm-Message-State: AFqh2kq7VkTQHYI6X36S9QgxuXHsP/nhTB4TXVSz3JCBrFxBvVh8aDBP
 wG4e75y1WBDa7lEyz/LAAgyNsfFaRdAr9srUP5YSM/mYkgJevgS9MPYeMvkdDGFWpdJL1kiSv0W
 QeRlSyull1pJl6is=
X-Received: by 2002:a17:907:d40f:b0:7c4:f402:9769 with SMTP id
 vi15-20020a170907d40f00b007c4f4029769mr24910656ejc.76.1671441560769; 
 Mon, 19 Dec 2022 01:19:20 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6kPb+9e5Ry8IGTmspfXo9j+BBGdFXImyLQtDpAyGUIAZ60rXB8R/rv40QTPViFxbTtgSgU5g==
X-Received: by 2002:a17:907:d40f:b0:7c4:f402:9769 with SMTP id
 vi15-20020a170907d40f00b007c4f4029769mr24910645ejc.76.1671441560556; 
 Mon, 19 Dec 2022 01:19:20 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 kw11-20020a170907770b00b007bdf4340129sm4215996ejc.14.2022.12.19.01.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 01:19:19 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Kai Huang <kai.huang@intel.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, yang.zhong@linux.intel.com,
 seanjc@google.com
Subject: Re: [PATCH] target/i386: Add SGX aex-notify and EDECCSSA support
Date: Mon, 19 Dec 2022 10:19:16 +0100
Message-Id: <20221219091916.690983-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221109024834.172705-1-kai.huang@intel.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

Queued, thanks.

Paolo


