Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CAB39F59C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:51:57 +0200 (CEST)
Received: from localhost ([::1]:56052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqaGy-0002RW-BU
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqaFj-0008Gq-KA
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:50:39 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:35578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqaFi-0007Or-3U
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:50:39 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 k5-20020a05600c1c85b02901affeec3ef8so1782894wms.0
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=nTVd0aVIq9NoZGZzoyUo36EyS4uYPDXHMmwtyYW/0SQ=;
 b=BfqDTg5wrndiqByx6aK7Q1d39yEBnxSMlaWYmp4KKyBk2NqZdL+PxRM4usEYgMl9cT
 SPUaDN7ZtT9TGHcs4XBY8LnjlzyF3RtXwWQ6467xOOm4sWH1HVqsHIc1H4QGZXtpSRc0
 vptpei3q1fMg0e4uLMBNNEbtLngNXornoqB1LFjisMuWP84TSfqwCccF5EeZd3wjNdDj
 fm+byss0MDY/oTJNbIKlteysyc5qBdG9HgYenpq5Bo9fwIfRfz/G7vkJHeAXw+zYS+nb
 I8PjZj7HaQRBnB5MQDTdVmAXHM3icIXauKKXD+JJBK/jz8WNVUPBVENKs+AwDjsw3BC5
 44HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=nTVd0aVIq9NoZGZzoyUo36EyS4uYPDXHMmwtyYW/0SQ=;
 b=ez1OUeEKjjm993F/7/wqejsghFRmawtStqGzPkjVu6g8QbotUuLKiXaaYDCs5u8x37
 fg/gMvuRlSUOxGglXMLirRq9Yz9BHRBvrM8cko9pOTo8oVUxrhpccOTd5cqUGZ3d6Xth
 wTjnGOsf6foBdoAXagerYGI+75HcqAtDFeMN4HFwAYH8HA2QUkS8TnjO+PFGdIIEyRN7
 6ZPiMX7dXIcAjtdh4ZnsPrWIG7fqZ8sbzoFpkyZni9melxYuRuyCPPjRDGtbW0WplMNx
 1Zq6m63A+i8GJHYd7FhNU7Xa+03+vuWUdRSpF8FT6DWUZUwBNfRBkS7d2wDQo9pl/C8w
 i7pw==
X-Gm-Message-State: AOAM5301isYngVXMMJnqUxGpsDl9V6oq57V59/OafcRldEvHdXNWCDaE
 0a49NLGPi9/wFV5Jwshjy0hHwjKYAYXqog==
X-Google-Smtp-Source: ABdhPJw1FGZ1pcYvC929B2XdQv27AtVwo1iNl+HlfVbMBQRRD9A6PkuB/RyDSj11rz5kT3r9q/hWmA==
X-Received: by 2002:a1c:2155:: with SMTP id h82mr22161974wmh.115.1623153036482; 
 Tue, 08 Jun 2021 04:50:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m6sm3345000wrw.9.2021.06.08.04.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:50:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2ACDE1FF7E;
 Tue,  8 Jun 2021 12:50:35 +0100 (BST)
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-10-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 09/28] accel/tcg: Move alloc_code_gen_buffer to
 tcg/region.c
Date: Tue, 08 Jun 2021 12:50:22 +0100
In-reply-to: <20210502231844.1977630-10-richard.henderson@linaro.org>
Message-ID: <87zgw0lgms.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Buffer management is integral to tcg.  Do not leave the allocation
> to code outside of tcg/.  This is code movement, with further
> cleanups to follow.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

