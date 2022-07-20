Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC5E57B228
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 09:54:57 +0200 (CEST)
Received: from localhost ([::1]:48738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE4Xn-0007Za-Rn
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 03:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oE4WY-00069E-7s
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 03:53:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oE4WV-0007E3-HE
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 03:53:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658303614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=N0In/PRqpaWTcJpwVtLUiaSFRmIP+VfUlL0PoKbfsp5847vN18rAGS7doISS7AWv+K6Xv2
 /k8ZjsQMRXLD/FrDseqoK1gjvx2sHZbZstBZNEndoua+hGvSvPEKJiHBkb9MBGQkuHG1Bw
 123ahXLBb4jxDFY/hXo4eZ8iU2c53BQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-oYbFChutMYidTpTmiNlycQ-1; Wed, 20 Jul 2022 03:53:30 -0400
X-MC-Unique: oYbFChutMYidTpTmiNlycQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 f9-20020a056402354900b0043a902b7452so11464329edd.13
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 00:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=a3BqDEB1F42/ac/ju84bX8Wfv1y3okoFC3hwxj8EC7Fy0tqon173x0z9ZLcF+ZX4jG
 Xz54FrV35dh1LqdN2tnG4GXojZ7Y2EaS42Du7qD+4o75+SRntMaAUWydL0C50SD2BUfs
 klVSqo06TaDNR2tNyes45ZDXxDuE35hR7KrbrCqAq4bKnVyma+ZipwyFrIzbDFPcbGKK
 svhic7RBuViiB8MFIW+CFTamlpxU+4SprJCBYtd2AJUDuTBtwMbn7OtgU0xoAEAREGj7
 Aj84B2Ytu3jU3xoUcRPwwLaf5ecbMwSlME3b9RuWnp5kR8M4Cx8v1VTyTZNo9IkOnpdM
 fj2Q==
X-Gm-Message-State: AJIora+o6vVf1WQceqQIER1PfoAwhcKQ6ml+hxhi2H9MzVvnhobyotU8
 nlUwGLt0uZsK/pgcWbuRCArAwWPerPglWKHGbnA9u1otYmLcVnwk/1CmE/Tql7vrfv+dnebhIHK
 JJ1wB0TuI13exIMw=
X-Received: by 2002:a17:907:60cc:b0:72b:40a8:a5b with SMTP id
 hv12-20020a17090760cc00b0072b40a80a5bmr33634667ejc.379.1658303609811; 
 Wed, 20 Jul 2022 00:53:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ta8K8/ulfRIu9Beh3uqHJ75ZOo+5BsITfrigxvx1wbYkjErgrtGmo41nb5X68Jd2pjh/oRdg==
X-Received: by 2002:a17:907:60cc:b0:72b:40a8:a5b with SMTP id
 hv12-20020a17090760cc00b0072b40a80a5bmr33634650ejc.379.1658303609613; 
 Wed, 20 Jul 2022 00:53:29 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a1709062dd400b0072b40cb28a8sm7557893eji.29.2022.07.20.00.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 00:53:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
	Mark Kanda <mark.kanda@oracle.com>
Subject: Re: [PATCH] accel/kvm: Avoid Coverity warning in query_stats()
Date: Wed, 20 Jul 2022 09:53:28 +0200
Message-Id: <20220720075328.599550-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220719134853.327059-1-peter.maydell@linaro.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

Queued, thanks.

Paolo



