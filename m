Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E311D62B34C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 07:30:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovBum-0001Sq-OF; Wed, 16 Nov 2022 01:28:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1ovBuk-0001SI-54
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 01:28:50 -0500
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1ovBui-0007kJ-EF
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 01:28:49 -0500
Received: by mail-qt1-x832.google.com with SMTP id l2so10148034qtq.11
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 22:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Tfo1tqUL0mvAp6iGDlZnHcRfiVugHfPk6LbB/JXUdz8=;
 b=WNS8PXgThYN/c2u6ntdMnODnJ5RdU+1nLNiuBjcE38PQYW2PaAPRsnDpTc2CRTCRQi
 ak/CIDLsy7uxIqfI4ok/G3yniC9HPR4dlEReITaSCjQqpgOB4keAeVtngxpx/mkuzyxb
 2RKH/Di4qW5nSFsR0w6IrLVBy+Yq1RKMYtqKWOI7xT8x0qVqZjoluUDdVvS7mMsTuOQp
 TxQx+hUXb/Y43I6kFRRy5A6DEO1+hkCH5/gAjhRaFGDKgU8RPOgVQyWT3DnF8uefFnAl
 eymIFFmwDwY6cVo9Ss07T1sXDljoqOlKRyeWtrse5dsu9jp9AkajJg3OSkvt9XJ9KOUY
 21Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Tfo1tqUL0mvAp6iGDlZnHcRfiVugHfPk6LbB/JXUdz8=;
 b=UGXwSH1bSKvEHJV3BbRiAvx1OFrcXePLLVUTlAZ2wBVUbg9qyjveSrF0jck88n6jsR
 52sVCE5LMpTaDJftkHqNUspYQfDhLkG6K+tD/e/SgoCaXkLEaN93kbJn2acSvHy+zcM5
 oFZL2YhwkkToO6iLoBzplkJuP2Mzuv4EUBb2Lr9rEwYhz62QvOyBvxiR7YghVY3nei1a
 Lr4nPVcOCsugpVW0l1iamnkwt22ZkWta6QlqdU3/IESs626gx/b4KWEDQbG628Exlm/s
 yidKiexKE1kETE3vhM57TVjtu6gu3I11qjnOCvzcppFKpjwNR86+FtGqmfyoN8UMvUMO
 tnuw==
X-Gm-Message-State: ANoB5pnrjeLgJyS+rpCrIkl/emg3RZUMJ3Nk9DzksZvR8V4iSTxQAzmR
 lUsvf3dTkpPJJAII+MGiO/qyag==
X-Google-Smtp-Source: AA0mqf4eETZgdrVsa4uKGwZ2LYArRbKDUUB4ZCowFxZMugnl4s7+kIvsXNX5ReD5T9LrwkqI/Crueg==
X-Received: by 2002:ac8:6046:0:b0:397:3f40:decb with SMTP id
 k6-20020ac86046000000b003973f40decbmr19412745qtm.136.1668580125246; 
 Tue, 15 Nov 2022 22:28:45 -0800 (PST)
Received: from localhost (pool-108-46-142-109.nycmny.fios.verizon.net.
 [108.46.142.109]) by smtp.gmail.com with ESMTPSA id
 e7-20020a05622a110700b0038b684a1642sm8295695qty.32.2022.11.15.22.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 22:28:43 -0800 (PST)
Date: Wed, 16 Nov 2022 01:19:12 -0500
From: Emilio Cota <cota@braap.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: Plugin Memory Callback Debugging
Message-ID: <Y3SA4Aod7GY4lUgK@cota-l14>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <878rkbalba.fsf@linaro.org>
 <Y3QNRWUK8BLRQlaQ@strawberry.localdomain>
Received-SPF: softfail client-ip=2607:f8b0:4864:20::832;
 envelope-from=cota@braap.org; helo=mail-qt1-x832.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

On Tue, Nov 15, 2022 at 22:36:07 +0000, Alex Bennée wrote:
> This is exactly the sort of thing rr is great for. Can you trigger it in
> that?
> 
>   https://rr-project.org/

The sanitizers should also help.

For TLB flush tracing, defining DEBUG_TLB at the top of cputlb.c
might be useful.

		Emilio

