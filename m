Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E59232207
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jul 2020 17:56:49 +0200 (CEST)
Received: from localhost ([::1]:59098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0oRk-0003VJ-Dv
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 11:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1k0oPf-0001O5-3d; Wed, 29 Jul 2020 11:54:39 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:40272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1k0oPd-00089d-49; Wed, 29 Jul 2020 11:54:38 -0400
Received: by mail-pf1-x442.google.com with SMTP id k18so5909079pfp.7;
 Wed, 29 Jul 2020 08:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DIIqYw1vKbqkfLYITP+1Dw+n1rUSkWxElKkba4zENuo=;
 b=siJDtlblDo1kderRSTKgM4dX1r4/uCZo8Up4KbIFA8WziLs2mpuMZ/qCwW+ruKEMsc
 dNRJkxaho4wWmKvEj5Dau9sG4xfCRa+gQYeFL9pRRdMOetdauhA0nkN4Ro5HvFaHGlpx
 riH6SGqhMFUFx5558BSlMBIbyDeraYUglBu3j81Q/WGQlvclNbkNAw1bxGrVylKt8VK/
 dmj2lhXBT+yOT8R7o4C0cXCbf+A6WvXnoG0uxZSZHxli9omxLXUiIWWzcUJnL2x9uULj
 CqaGVMBiOvtTk4j+03eywbiXKwRHbUQ+GWX58qX9Xw2ns9hB86XALigj1Vl7Hsc1D2af
 2LQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DIIqYw1vKbqkfLYITP+1Dw+n1rUSkWxElKkba4zENuo=;
 b=Dbw9rQeKzlYxbNgOo8OQMkyEEsB/HUWBdiH1oApZnFojkiGNxCdTncFBAlm1wMHY/a
 eyG6vBHNe7ULOfpJG4je/wEIORuf+auNdVM7xIe4MmBNLZzf53ZAqcWmBoba6wQAbpt4
 BBum2HOLXEPDWbVeiDL6GtDQVrAD2eGQDNeVZjLf06ckQAMKTRY25+aY9Cz9X1bCux5M
 JQOuC4c11xdvdIs/qKRHthXJCLX9mcCsfqCg2TSrhMa+MjhHPeslDwG9Ss/7urCv5fyV
 lnqoFGm98Hw9OI77jiPDcCLJj6+JOfMQ8LWx9oWG8p6QymO+Aft82ghsbGNSIv8sRdT1
 IX8Q==
X-Gm-Message-State: AOAM533oLXlt6YzNVtJSbkb7IpMzZpW8lhLWW5uPB1GwmNptNd52c4FY
 l0PO50VyuDtWmZGuaRNib8c=
X-Google-Smtp-Source: ABdhPJyDi2LRIDzNKZQDMr108LiTV08HRAPv9QpK0sHHjjsjp3koOnZugSJzYr3GRdeZ1pCjohuJRg==
X-Received: by 2002:a63:135b:: with SMTP id 27mr30814504pgt.37.1596038075124; 
 Wed, 29 Jul 2020 08:54:35 -0700 (PDT)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id n9sm2577877pjo.53.2020.07.29.08.54.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Jul 2020 08:54:34 -0700 (PDT)
Date: Thu, 30 Jul 2020 00:54:32 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 08/16] hw/block/nvme: verify validity of prp lists in the
 cmb
Message-ID: <20200729155432.GG14876@localhost.localdomain>
References: <20200720113748.322965-1-its@irrelevant.dk>
 <20200720113748.322965-9-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200720113748.322965-9-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20-07-20 13:37:40, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Before this patch the device already supported PRP lists in the CMB, but
> it did not check for the validity of it nor announced the support in the
> Identify Controller data structure LISTS field.
> 
> If some of the PRPs in a PRP list are in the CMB, then ALL entries must
> be there. This patch makes sure that requirement is verified as well as
> properly announcing support for PRP lists in the CMB.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>

