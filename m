Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 738E537A844
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 15:57:11 +0200 (CEST)
Received: from localhost ([::1]:44706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgSso-0004oc-Ix
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 09:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgSqd-0002Uz-Dt
 for qemu-devel@nongnu.org; Tue, 11 May 2021 09:54:56 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgSqb-0000QL-Gb
 for qemu-devel@nongnu.org; Tue, 11 May 2021 09:54:55 -0400
Received: by mail-wr1-x430.google.com with SMTP id v12so20221869wrq.6
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 06:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=eSAu7Ms2TQQpxLoKZGkSoH0LnGfBaWcfDiiMk6Q2eg2xNTL9xXuwBKiC/0jKIZTbBz
 HEnW7CQdZt2iEn9mRnbTNC9Gey3cCfLS5psDRtm7W3TA2pTFluYi6okizBaeOPRIlXm+
 H5d8U+odIpElLo9gkv38v2SY5N6xu4zCMOMz8d+BvGiNU5/1A4q9Ue7DwIudhuV6XMTA
 LZObuNqfj/ZSx4yifsQjN+HGa0nvXG3EbcS6xVjLCYYtRuwyIWM/2TTNH96aImS0bww+
 V7gucQXLga6ufwofDKHssxJuk7Q3OidAqMamynGqgk9h8i5PsAF+uKuyRgHFO6X5fkUn
 56jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=amuiL1Obl06rXcquR3BSPXrPVVoAeQQ1W1JJDX29j9mlDhyacwbmJSQSYj5npEEVQ/
 53Nd5tZjkHK6Sx1CRYks0LKKZ5oetOu7g9CexJmq9eaP5ASfZQbQkttb0HlEgOv8u4OD
 Jmau+dcP6e/pd9PQeXOSvE4RnP8YYGknKDFg4lghLdINLmyrWHwO6bXw3yVC1V9rMRR+
 pZHW1iNx9/cU6wZfT5hsTV/cTK143u9PewOewdMpyL5NEFLWWYtHfdhE436O+X0egGjp
 jEZ3kWUALltZHr/7yajl8ZZdXplcIceStph702Okso2WaBL9IbFxE41EAJaIHLmwjg6e
 WtaQ==
X-Gm-Message-State: AOAM531H+IxZA4dCSU93QMSTMY//5SHjsCUGG+9fZ2C0N0b8sdCW1jdR
 nj8JiLPbR276MMBdZsDQ2wJQDNudiMquIg==
X-Google-Smtp-Source: ABdhPJwMiX+7g8jpVszdVsKJHTJvEVO0aUMJZzn4/HlXtWtTMmQ8qzfCrri4InFW9cy679Qc99za3g==
X-Received: by 2002:adf:f1cf:: with SMTP id z15mr39022130wro.97.1620741291904; 
 Tue, 11 May 2021 06:54:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o9sm3705225wmh.19.2021.05.11.06.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 06:54:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 44FBC1FF7E;
 Tue, 11 May 2021 14:54:50 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-23-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 22/72] softfloat: Use pointers with ftype_unpack_canonical
Date: Tue, 11 May 2021 14:54:45 +0100
In-reply-to: <20210508014802.892561-23-richard.henderson@linaro.org>
Message-ID: <87im3pgyty.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

