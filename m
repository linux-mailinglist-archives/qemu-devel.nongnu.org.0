Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 082674A66E4
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 22:17:25 +0100 (CET)
Received: from localhost ([::1]:59838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF0Wh-0007YV-PT
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 16:17:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExuN-0002sc-74
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:29:39 -0500
Received: from [2a00:1450:4864:20::429] (port=43979
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExuL-0001iC-R9
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:29:38 -0500
Received: by mail-wr1-x429.google.com with SMTP id v13so33639218wrv.10
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=fQpeyfkzd9TFVIUn7ElwK8JYz4Ha8k/I0+NDEJUw4RtOOMcXG4O9DUtVoZZKCIMpT2
 qn0z9yiU8sOrJGj2fZkKIgoOS2+axZdhE1sw7LcDwCRB3cDp4sbzj+25Qei+uX1L6zu/
 LGGTKuaHOOk2lpv80BIhSUfak4gWXoHFTReiUNZvbUUsqhYcUYgGo/Oiw54cxotLvXfc
 /nr/0W3JdVaL5zBvsBuX3R77yuw7uFRkNEBSC4r80rXImusp5i6CJ1rd/pcGdKE41mV9
 USDX7G9XpMkp74RgCyIdORv83iHOoOophw8VMeL6LgyYwjYgEyXwSimVme+e1oIPmXEw
 ah6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=YW4pF0LV3JoSSPuhiB0j4bG27/LsbqdfoL0epXcQC57DJL9JbbqWGnmAFjRXFhKJgr
 YjAtbIIYrQsrDTlsXn9bf7UdDXvx40ZY/A5d9SkKsH+2Imsa85P0BmYdU0Gxw8czK6Wr
 7caVOcB24ofdEvuPze8uPXmstUcLd9q4dzUBAGCHTwykSMUiZOJXKG/p+tNBuvhY7Rkg
 l/uVcKGCh/qTokylJDRcWFB+wA6rbk1MkW5EWJ3NWPuzRr6CVpxOxgvu3iwf7fXvefp+
 ACfRQHeNABuPOOMAWli7RIVAcuVs30Ye0vdQDK3rQ1TrIP5bq2RA3kHlqUVCcPCRFPtq
 UeYQ==
X-Gm-Message-State: AOAM531N0721dJnZIbuGw9wjFTxDj6ZkKG8zxq2huQHYJGdcmt8n16nt
 MIPQXTv3lUgPu9QaBlIzXk/+eB/r3Ev67g==
X-Google-Smtp-Source: ABdhPJzK+Avcf2vtCyE1jjZMSOOpbBk8ij6HMSZrNs6xU6bQPSxuuZer+fojc1/AcHGuCWVQQ/VXeQ==
X-Received: by 2002:a5d:548a:: with SMTP id h10mr13595882wrv.221.1643740166696; 
 Tue, 01 Feb 2022 10:29:26 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x13sm15299488wru.28.2022.02.01.10.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 10:29:25 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D96BE1FFB7;
 Tue,  1 Feb 2022 18:29:24 +0000 (GMT)
References: <20211218194250.247633-1-richard.henderson@linaro.org>
 <20211218194250.247633-4-richard.henderson@linaro.org>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 03/20] tcg/ppc: Implement vector NAND, NOR, EQV
Date: Tue, 01 Feb 2022 18:29:19 +0000
In-reply-to: <20211218194250.247633-4-richard.henderson@linaro.org>
Message-ID: <877daexwxn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

