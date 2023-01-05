Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C82465F581
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 22:09:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDXTa-00007B-Qz; Thu, 05 Jan 2023 16:08:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>)
 id 1pDXTX-00006e-Ud; Thu, 05 Jan 2023 16:08:36 -0500
Received: from mout.gmx.net ([212.227.17.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>)
 id 1pDXTW-0001EL-6C; Thu, 05 Jan 2023 16:08:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1672952910; bh=dzjOvrT4yp0v5TSS+sWdlR9D8uuwQz7XXam4axQwdCo=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=njpegxySOEaR+RbpDYEz1YLr3RspOPqAJOQjqTA+XWt0RN1DKZ69h11UCAQvDcHxu
 367bv20a+68a+bfPhE7yXvjF2+UF87LuLv6dGjW1v7OPEyPo1jwbdyxU5KHEjlxJD5
 HZ/A241MaHC7huQB89cDMtoR6JWtPIdMRsHTso7SUt01EJP+HKtiaC/cpwC+bLCwJA
 sfomZqNmILjPKMwdgmIALj02Rsm8JSkfw2vKLcGKkuTeXGk6nzzrhXtQqplYsC8FHf
 fiChx2vv/k1w9Pwq7oSvmk7IEqaYNmDpI2he3nn+6kClN+4pSDrpfPc6PZ4naNp1nj
 l6fuZNa6jXIHA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([77.4.96.127]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbzyJ-1oekDZ0Bgt-00dZ6E; Thu, 05
 Jan 2023 22:08:30 +0100
Message-ID: <fc8d1ca8-c630-71af-d91d-5d334fdb64f2@gmx.de>
Date: Thu, 5 Jan 2023 22:08:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH qemu.git v3 8/8] hw/timer/imx_epit: fix compare timer
 handling
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <166990932074.29941.8709118178538288040-0@git.sr.ht>
 <166990932074.29941.8709118178538288040-8@git.sr.ht>
 <CAFEAcA8u-RdHJGw61tN=qkWwwLsDgm0o=BZsEhBKA__cnmw9yw@mail.gmail.com>
Content-Language: de-DE, en-US
From: Axel Heider <axelheider@gmx.de>
In-Reply-To: <CAFEAcA8u-RdHJGw61tN=qkWwwLsDgm0o=BZsEhBKA__cnmw9yw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:yeeSeorHmaUHBqYHYlrguGPsRHRfY0iClzEJKp+OqukTDNb+QM5
 tnzLXk+vj3xmUwZPBQZIG+zYAc90C9pD4Yq5R36oVIEEfBFLm86m92PzqzVK7inwERbUr7D
 urZbbrSbhdiIsCepjSacx6btia+LCNGjTqsVhlRFLF1CrHqXHKZAyMPQv591gJj9Kn1JEDu
 KYxY1TXNA6adhWiq2/XpA==
UI-OutboundReport: notjunk:1;M01:P0:gAxyeQ/Dp4o=;I1oiOn2ZPv+jZK/f/uiTVjUEQ6R
 PJocYv+m3KwL7yTVjY/iuNzBttim4eZS00tXqiPKYhPqQuC4E2OSt8UukZ9byHBJNPic1e4Th
 e00M4dhKl97zAwxXAJDf4gD/9HrJP9p+Vu005bwoLOSQKE0C7Fc6kKiDFnzPhN2iEu/0YNUcM
 k29OwvrWndTjA89oEO+iXrRw+yxMwEMGF6ksZ1o7fHoU96scpkKwQeDVNvXAbmpXs2XZA3KXd
 FWLFyUoHevxM3+HBnSz4B1IHtKMMo87CW8MWgs4VI6GO4UtDEI7O4K2tHFJpqH6KGW083cWNV
 pRidwMkzahKBxawHDQ/Qf4MteOAvHUSc3+7MvoEFD93XOXqiQEAxUfPDYdKeg9UTg9f1jaU9C
 T52M8O31gOqw3tCodLq6PoVLTSBOU267USo03uTtjDtPZUT+CKiTKWeZwCpS6UbVEDwVv2z47
 BuUobkeLPY+wOhSuYvFbhmJrH8Yf8na4e5No3rH6hCpATVuene4IeMM6jgFsNj1yxbWH8RCcy
 duQFZA9SnedHV11JZBcgbm5zEsGJlmiJ6qL65Pl7ur0od6JruddSegn4Q6J+x0cQ4JLrKP8AS
 1YM4lfxaLqdBAOTxpf533nPvx5S+UQ2TyQzzVDTrXJ7C1wr7XZ1QqWeHeFNYe+0zUYadcFNby
 qfQjhwuFjC0QRUUbHPQvQ+kRv990SlVmWAuYToBNnbEFmGbavkRqI8B+tonGX2uf54TfWpymD
 BPaMi2aPBX9oN8ROl3uNXwpA0iEtQdbCN593aKJPPWv9i5Zwt0Uq/IOpH1Z35HWbsWt8OC7p3
 sGlKFiRC0q5HfJbMBMNNJPkWnY8GSaXO8J4klZ2rYdka7YYpbliDzEFezqO0500VotVsfxqKl
 oLSBXpMrC5cEHerA8QdGE4Z8MrUt3fN3HTYZh1tvxu8HtE3XV3UaCMziK0i9deCR1sBBSlGpb
 iSgHdhvm/1a9XvSP0GjmeG62Ii8=
Received-SPF: pass client-ip=212.227.17.21; envelope-from=axelheider@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.939, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Peter,

> There's a couple of minor code-style issues here (block comment
> format, variable declarations in the middle of a block); rather
> than asking you to re-roll the series I'll just squash in the
> fixes for those:
> [...]

Thanks, that makes things easier. Seems these still unfortunately
slipped in my last patch iteration. Your changes look good to me.

Axel

