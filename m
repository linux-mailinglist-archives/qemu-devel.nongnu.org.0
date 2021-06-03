Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA28439A362
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 16:35:17 +0200 (CEST)
Received: from localhost ([::1]:49502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1looRI-0005se-QT
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 10:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1looIp-0004Gr-QQ
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:26:33 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:47024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1looIo-0008E4-82
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:26:31 -0400
Received: by mail-wr1-x435.google.com with SMTP id a11so4171378wrt.13
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 07:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=AUGy+ODpnOQT5nx2oo5uQ8POV0KMg3D2AeSx0yiCNLbCgDuhgLOFtiw3GaxwxOlMiP
 YaUVFNreix9ttcaECn9CUw+7zaX1YCoKM4rnMozi7ZTBTlAepoODmqPmouYAUg2Bumr7
 44zRwNzOq0aVA22R9Xca3ES5TeF00KA60oJ/CBZOj5SZEUKY9e+C8B2/DSSpmEHF8H+H
 Tv+Yr2RBfDnfNQkABhn5igUf3mOEtgPOGrpc2TxMXDUFbuhHzfEsjHHfR6iPXp1+P5Jz
 9brbMQubbP1Up4YkdHfBLDgbrtm7YlyfnpAOsEk9EL0eFGRZfrhVj3N0+4dQDadpU+NH
 pXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=rt5ZVv28ByZM2pHLB4hWCLwB/rUXGAYkNf09e8x/hzhcOW8QASJhQ3VWBgCOA9eTNo
 yO/mOSsKiaNq6bPld5KWVDujHKR1v2XTovJwDg6Y2Ug+ZWpahDVMGTAchNcfTVF0aOOQ
 3OJn0LrVRJZ1j0cbc2692wvCfXxPeBMIgfJqMr+bdjCITlwCkcjgh/3HiztFDsf6TQ3Y
 oogYivPjiAAHH94RnN+h/VSUOdnCoSbLAh5TMYoKZCr726DcJkSQj9D1y7uWqJZil2o6
 h13pMkcPKYw+ESVPX8aYOPzQsVd/EeDSzSgDJEGRGhZBQRA2wkj2MCnKimY05c21EPnH
 c8Zg==
X-Gm-Message-State: AOAM532J+m6QgGk+X3a8PbhqiCp8OTjL46BnTaAq4FWrCOD1kyiVsWPi
 Vuqy+MgcgK66TdjWvNqZGttN7g==
X-Google-Smtp-Source: ABdhPJxmMs7XUi4FkJ8Yg7Z53NszjW6yIEhR5Vq76DqBa/Mr2IPtNm1Nwx1Ar2d+5mYv5/WJDO9SHA==
X-Received: by 2002:a5d:4c4b:: with SMTP id n11mr236017wrt.269.1622730388865; 
 Thu, 03 Jun 2021 07:26:28 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p9sm2804000wmq.48.2021.06.03.07.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 07:26:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5E4461FF7E;
 Thu,  3 Jun 2021 15:26:27 +0100 (BST)
References: <20210525150706.294968-1-richard.henderson@linaro.org>
 <20210525150706.294968-20-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 19/28] softfloat: Convert integer to floatx80 to
 FloatParts
Date: Thu, 03 Jun 2021 15:26:22 +0100
In-reply-to: <20210525150706.294968-20-richard.henderson@linaro.org>
Message-ID: <87pmx381nw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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

