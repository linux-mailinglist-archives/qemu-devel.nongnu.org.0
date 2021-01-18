Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 723DC2FA068
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 13:52:48 +0100 (CET)
Received: from localhost ([::1]:33386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1U1X-00063e-Ft
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 07:52:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1TzP-0004gj-DI; Mon, 18 Jan 2021 07:50:35 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:42800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1TzG-0001Mw-SQ; Mon, 18 Jan 2021 07:50:35 -0500
Received: by mail-pl1-x62e.google.com with SMTP id s15so8599100plr.9;
 Mon, 18 Jan 2021 04:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yQhpZ5m2TAfpymIa9INYQdstPu0umbaEZF/uTq2krwA=;
 b=vCEzczWeuVYP8ncJdSb2k5K7bH60oARHikggYzCtKcSygdvauGNM1lymmUIFIjLNCC
 cM+hGCj5rQy3z/1rq7CIYnW/g3wn/KZ0nmI3oRrNXz/KX18ehP/jLrJSCNY4hOw+Mnlq
 yo6leXnofRKejR1FdCm72HT4I11/AEsUapmXIuQxUMFvPagqZ4G14NYxxy3VAZxYGTGA
 nS3GtxZQ0nvrx7PKC4rOM7xSEJg+1jVS3ttsdRdN/Hnb68kzXmOcuND3GqKSkSIG+hht
 WDexYxQywb/fbwX88v6ncqYCItCrBI8QeNVest4OT437P/MYe+shS0WrMPYK6sEvf2YZ
 8TBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yQhpZ5m2TAfpymIa9INYQdstPu0umbaEZF/uTq2krwA=;
 b=MdNr2LNB+d7ar3WeNZzy3jKjxWhdkH2mhuH0lhhV3V8jYu4CRNOvlDB5lkmgvNK/qt
 DM3+CLrbUxX0+s5MrP9oRpW8EFZuV06MB4UfhImzc6JTO8ZKPtqnrksr5KmMcbBw9IoE
 vGDiDBuFvOrTE64SoJJ6nGITvCvCPMNdxzZdnaXJWyKAaZq4So/oScGYy0KmMGD4BKfJ
 UAChZPCzw3JeKk0wCSV/MGkiySgoxxMFYkanryLvZWFiV3cIZB6XT0PMb1p7Y4j0wch3
 bAwJxHFt32KlWuSUVJzsTzFnmwwlEaByzjwrdwyfmy/UFFtsCNkJe6mzokli3nWytwq3
 biJQ==
X-Gm-Message-State: AOAM531Su/xWPVlIr4A+yFPLiytM/vNraK1W5Qns7jwsQvRVWlWFOa2v
 edtZA36gIF08IGUhSWyY5J8=
X-Google-Smtp-Source: ABdhPJz4DdsxAEs8MNp8+CQTb8ONj7+gTZn0LDs+bMnm6KoRHizvebDrifHnn9bUHhvIaYlSZOnEuA==
X-Received: by 2002:a17:902:e8c9:b029:de:a2c7:e661 with SMTP id
 v9-20020a170902e8c9b02900dea2c7e661mr7388026plg.76.1610974225017; 
 Mon, 18 Jan 2021 04:50:25 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id d11sm3332458pjz.29.2021.01.18.04.50.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 18 Jan 2021 04:50:24 -0800 (PST)
Date: Mon, 18 Jan 2021 21:50:22 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2 05/12] hw/block/nvme: allow cmb and pmr to coexist
Message-ID: <20210118125022.GE18718@localhost.localdomain>
References: <20210118094705.56772-1-its@irrelevant.dk>
 <20210118094705.56772-6-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210118094705.56772-6-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>

