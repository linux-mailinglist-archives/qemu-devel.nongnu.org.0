Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F00736E7B1B
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 15:42:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp83M-0001vP-Bh; Wed, 19 Apr 2023 09:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pp83H-0001uo-7I
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 09:40:51 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pp83F-0008Q1-LZ
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 09:40:50 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f178da21afso11198265e9.1
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 06:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681911647; x=1684503647;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wh96CBaUa/gSpe99ICrPIQ4LiaaJ+PwVs2L98yBOVpI=;
 b=BIT48XKTsrXROylkjIBkEL4qBZXCsOxkFHT89hMQ8DFyWs/EkC5U4tS8Bc5wgt9O0E
 AgeEe6VyTNFkpdS0MI9mimvQbFHfMf9YnnvOEflm7dbv2YtUH8X76cH1YxLQnWeHVzks
 2HxrXAF7bxb3/PBL/8psrllnVSVwNo9dwoHGFVAGdlkhGYC0EVDL0jzh0U+m5NovuFbp
 dfZMo/A/dErtsTvkZBTZ7e8UW6NnPFUhK7FTnQmbi+YQ7ddWBj95Wkyo/X7pqlqY9LYD
 Gi6bHHWja2969+wusmCGI4Uas5KztQlY7DZqtgnwXSW8FI/CbVdY81rf9/Weq7y/TWrG
 j5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681911647; x=1684503647;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wh96CBaUa/gSpe99ICrPIQ4LiaaJ+PwVs2L98yBOVpI=;
 b=LqyzTQ5a689g6+lGKO6x4xf+lrBcst/G6d6K519TmHyfhooi2tPhyd+9GPnuvcaHo9
 vWRp7EVMTmgw0j4nR/sRYm/2tEiY0TyWB0+Bcu9AlgsQz13CRAlFEVWAjR9YMYWVCbAX
 qkCuHOEjSsNqt114eRwjo6MKfoh9IyK54FVOmrFumqkqkFAjdK44DeuYGlJBsGg7NaKB
 Rnh6SuLTciK3VA8thXcYMxyvvbXbunzNrpwi8WuY1d94jto3Ongxpl1BsTM+HocUnWyj
 4SJE/1S3LeHuhnNWHYhO2AR5BWq386zsbfCNQN1nBgEKpX9ffy9QccOeWyAipcvhdluP
 8MpA==
X-Gm-Message-State: AAQBX9cq3AbQVbszocmE04KGhFPeHsX8tkCKxGbZaMciGB3uqi/JINgm
 5cpZF+KVyqB7NA6e81rPofBx0A==
X-Google-Smtp-Source: AKy350a/dyOksqFCHZoI6zdlVaNjr+bWyZ2VZACXUqJTTJtewRTIgzSAfRi/E4X68FPlKSl2Z5m4Ig==
X-Received: by 2002:adf:e3d0:0:b0:2f8:5767:2d0d with SMTP id
 k16-20020adfe3d0000000b002f857672d0dmr5018661wrm.68.1681911647516; 
 Wed, 19 Apr 2023 06:40:47 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h8-20020adfe988000000b002efdf3e5be0sm15850230wrm.44.2023.04.19.06.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 06:40:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C74C21FFB7;
 Wed, 19 Apr 2023 14:40:46 +0100 (BST)
References: <20230419124831.678079-1-thuth@redhat.com>
User-agent: mu4e 1.11.2; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-trivial@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Yanan
 Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] cpu: Remove parameter of list_cpus()
Date: Wed, 19 Apr 2023 14:40:41 +0100
In-reply-to: <20230419124831.678079-1-thuth@redhat.com>
Message-ID: <878reodm75.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Thomas Huth <thuth@redhat.com> writes:

> The "optarg" parameter is completely unused, so let's drop it.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

