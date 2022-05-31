Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D082B538EBE
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 12:23:25 +0200 (CEST)
Received: from localhost ([::1]:33588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvz24-0007ZE-MV
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 06:23:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nvypu-00022Q-9l
 for qemu-devel@nongnu.org; Tue, 31 May 2022 06:10:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nvypr-0007yv-Ew
 for qemu-devel@nongnu.org; Tue, 31 May 2022 06:10:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653991845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=NnnZ2iYjSk+Dt1Q977K78BXx8zAod6w2QE0870/Iy0DFzVTw/QLbVH0Vbd8zhq/0h38vjy
 ElRm6eWl8Cs5frZqeDQ+nQlsxZD52tvpEPiiD1nNPHVr0GeNqOdGYWAzQ3SjoBM/tWz5LJ
 /f/Hl7/fIMo6P0qRkzhwPOZK11YCDOs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-ICHO8A5bPCCituKsBRUc_A-1; Tue, 31 May 2022 06:10:44 -0400
X-MC-Unique: ICHO8A5bPCCituKsBRUc_A-1
Received: by mail-wm1-f69.google.com with SMTP id
 o3-20020a05600c4fc300b003946a9764baso1202107wmq.1
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 03:10:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=4SbQxRWJxJOOLIsmGu6h5K8zepiBF9xwcV4qC7h5KHj/jNy3ltQZQzzpSiDYLY8WPw
 pTTAGZ3KqXmuiL29xFWEfb1/UCFAccTZKzvUm1Bu7yu3FVE2XH44p+UzOnyVvOG9N/ma
 0rv/auvYwX/txRv/69F76buB1olKwAQxX2/jt/wNNQRqrOiPAAT+tv/j3JOYQrHlww1F
 NmYkHis8zg9oZMZ2Rn1bI5QM0s2JRuFzb7enQZNJ5bhQpaNq1XPYzS1ZvtTtC0tPKtyh
 EnijT9LOAMGkeskJdB4tsywWmUmNXTYfxPp1Vm3ka4MHHixlTfFobk3WTxaIDcJhLlnS
 mqlQ==
X-Gm-Message-State: AOAM533VxdwAWsB8e7mm85pXpm4mwex77smYtaPsVTuTQBulX65YpmJC
 4YS9M6qx6bI/SMm7Q/igm0fFUaxI5FgBzbcU5aVsy2HkLasBttstRCmQtFcqDAv5dkbj6ozkXDd
 BG5sbahcrKMZkxYE=
X-Received: by 2002:a1c:f208:0:b0:39c:1282:3d04 with SMTP id
 s8-20020a1cf208000000b0039c12823d04mr7116063wmc.26.1653991843079; 
 Tue, 31 May 2022 03:10:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxioQXJWh2VEsshPMQGhxchM1UCXNqZjtw3+FId4qVxrGwDhfJRC7S8HcLQkWNFBlFK3dvccQ==
X-Received: by 2002:a1c:f208:0:b0:39c:1282:3d04 with SMTP id
 s8-20020a1cf208000000b0039c12823d04mr7116039wmc.26.1653991842766; 
 Tue, 31 May 2022 03:10:42 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 l13-20020a5d6d8d000000b0020d0c37b350sm14113342wrs.27.2022.05.31.03.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 03:10:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Yang Zhong <yang.zhong@intel.com>
Cc: qemu-devel@nongnu.org,
	pbonzini@redhat.com
Subject: Re: [PATCH] target/i386: Fix wrong count setting
Date: Tue, 31 May 2022 12:10:40 +0200
Message-Id: <20220531101040.817165-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530131834.1222801-1-yang.zhong@intel.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Queued, thanks.

Paolo



