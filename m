Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3FA6EF43B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 14:25:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1preCH-0007Ku-BE; Wed, 26 Apr 2023 08:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1preCA-0007JO-P2
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 08:24:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1preC9-0007R5-Bq
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 08:24:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682511864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=WGSeY08RN16EFmEU1YxdvsapNjNEOKfvDUzhrA7Xuea8XoWxYI/5esVUIjgTlzyWWFd+9X
 +nCNtf884WIwn3sXJjqhs6r0AqhYm/ET5WxX8dY9yWpJnKAzM/5BGy8QBM41XSNDC9MYst
 UlaQ41FgPfibKlU0pg3xFltCBxcypKY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-323-MrWrras3NhmmxU4lVEaK2g-1; Wed, 26 Apr 2023 08:24:22 -0400
X-MC-Unique: MrWrras3NhmmxU4lVEaK2g-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f195c06507so81606845e9.1
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 05:24:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682511861; x=1685103861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=CuS5/+y9DpQpJMV0vixhOxp1oZic8bzIY4YQ+aBRar4gJBBKN6TE6x9TzNFDNcwDHW
 ZPe5vVwC3wWWpMoOIw8eS7i4ZH55UJjoUGusyfL4iQni9aLXO5GFfLkyUodOmzUIHLZ6
 0qka9V9unS3Q/RZqTKx2pmhqwromGZHo4qejzPPuysyNutnYQpanFJc/wOxVkTOLvD+f
 Us00iBB/371w17IFkJLEL6tw3hP4A2tP1N9V31WcV9B51pZG9jNZ89dJNbDuioa5VWXb
 owfb1Uq6y+m7eYLFXK/UCAe/6q8PzRT64gF4BBIg9STF2g1iQKTkXZbeL0BawiaiGzQN
 VVTQ==
X-Gm-Message-State: AC+VfDxvUT87/+uCKoSBIBMK1rKZdqQc9oLBgjiONNSIVyX2GpGz0ox/
 kulEIdb0DgD2++rN8hJK5DVX1X0CV4uxoZdbKsd8Sv6U7k4yW4RcYFeh09SkbKPxF2yiYjflXTy
 zpmUs8ajbKv8lCuM=
X-Received: by 2002:a5d:66d2:0:b0:2ef:eb45:2317 with SMTP id
 k18-20020a5d66d2000000b002efeb452317mr1615881wrw.9.1682511861517; 
 Wed, 26 Apr 2023 05:24:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6ViqYADJDaBqWTHZv102hDM2tKhuKq/nIBHbYJYOE3bPelupsc/WYSfds75kBaIDSg+kYK1g==
X-Received: by 2002:a5d:66d2:0:b0:2ef:eb45:2317 with SMTP id
 k18-20020a5d66d2000000b002efeb452317mr1615863wrw.9.1682511861241; 
 Wed, 26 Apr 2023 05:24:21 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a05600c204100b003ef64affec7sm17931915wmg.22.2023.04.26.05.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 05:24:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Tao Su <tao1.su@linux.intel.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, richard.henderson@linaro.org,
 yang.zhong@intel.com, jing2.liu@intel.com, vkuznets@redhat.com,
 philmd@linaro.org
Subject: Re: [PATCH v2 0/6] target/i386: Support new Intel platform
 Instructions in CPUID enumeration
Date: Wed, 26 Apr 2023 14:24:18 +0200
Message-Id: <20230426122418.41074-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230303065913.1246327-1-tao1.su@linux.intel.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


