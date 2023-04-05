Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC166D7C36
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 14:09:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk1vv-00030U-GW; Wed, 05 Apr 2023 08:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pk1vr-00030E-1d
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 08:08:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pk1vn-0005LA-Uk
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 08:08:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680696482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=jE18GOb05c4QBQ1U+8LRVOXwttC6F/7kNwLv6hJARwuVluEDTLVbfiWwThyurWrzS2RwUN
 ZdtuNN/hyHg/hN2WrxQwOqBoppBnHsHHseqBTbUIr/4Wz+TQMh7aAemj+t1LtX/qY3GKnn
 1K8cHEhDT+26nSIdcHvmuNPVfjMCRYQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-YaAbUYTgOQOei2CSIHMTBg-1; Wed, 05 Apr 2023 08:08:01 -0400
X-MC-Unique: YaAbUYTgOQOei2CSIHMTBg-1
Received: by mail-ed1-f71.google.com with SMTP id
 r19-20020a50aad3000000b005002e950cd3so50288841edc.11
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 05:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680696480; x=1683288480;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=mN9L6YLqfp/hKhSRCMTgIJspr6V/T3IvmY3cOGrbI9fsfK+mMRBD1GPiQgZh6fqpke
 uSFlIgOvbSp253YyMg+IjW5EkmiY/qzZlPNkpXdDSC/Yxu5+BEqUel0pdgiG5L2sVYLw
 YS4xyD+OYe5FUXi0EuMtpeTA9A0gULVEO/vtEPeUymHQHTZzLgPSkMxUuqA5xqE6gcsu
 wdJrkqy7EpqE1N4XCFdiet8lLT6mjJlBNnF5eMirV6dt6ApCTiTIi2CKCNhOXjFLImK0
 1iXCawAzYpJq0+mVEI39QzhoGeQUSxc7uklb5wmzK1VlnwcR+x3b0lAf6RM8AXox9/ha
 Wkow==
X-Gm-Message-State: AAQBX9eTtD+gihDsQbFEtUJrZSoSucgW4mi8rNCh5pM4cvwzJjUDEBjB
 mU7jfSHAJoTwgMGXxOWxiwtvlDFpghw8/4RfYbXtxTWBDlFwbK4SGS29uSGEWZflCEDCFCK1ReW
 6gw3adAgBXAKuGzE=
X-Received: by 2002:a17:907:7893:b0:933:44ef:851e with SMTP id
 ku19-20020a170907789300b0093344ef851emr2438398ejc.55.1680696480218; 
 Wed, 05 Apr 2023 05:08:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350aC1S7EztdIzcuCmB48Wq9EgZdY/DfGPIYYmhk8fChY+AQs5xqvKoU/XJxwigFbbxPQeDTObQ==
X-Received: by 2002:a17:907:7893:b0:933:44ef:851e with SMTP id
 ku19-20020a170907789300b0093344ef851emr2438382ejc.55.1680696479939; 
 Wed, 05 Apr 2023 05:07:59 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 t17-20020a1709060c5100b00927341bf69dsm7290352ejf.88.2023.04.05.05.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 05:07:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] configure: Avoid -Werror=maybe-uninitialized
Date: Wed,  5 Apr 2023 14:07:53 +0200
Message-Id: <20230405120753.134547-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405070030.23148-1-akihiko.odaki@daynix.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, TVD_SPACE_RATIO=0.001 autolearn=ham autolearn_force=no
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


