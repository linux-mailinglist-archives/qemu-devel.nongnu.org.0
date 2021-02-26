Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E389326330
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 14:17:00 +0100 (CET)
Received: from localhost ([::1]:42468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFczL-0001SU-Ik
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 08:16:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lFcwr-0008Id-VA; Fri, 26 Feb 2021 08:14:26 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:44744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lFcwn-0004t9-DJ; Fri, 26 Feb 2021 08:14:25 -0500
Received: by mail-pf1-x430.google.com with SMTP id t29so6219578pfg.11;
 Fri, 26 Feb 2021 05:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GMsbw7TKbGGiqM/9ZPKf7oo5mFNwwzVPMoCjckGS0Ao=;
 b=JfitXIA5C2WH29iUE8I7pZpkJ8WlvISgSMLRuSNMDaFNCL0voHgzkWveG8uJsKq4lX
 iBl0io1K9Jdk+lpPls7cQU5iWeRT4dmlv2f2I4DpkqJ1ANrrPO86AfqQTTDg/irfHHLQ
 6mMrNc1/zYUbstwjjNeXBQJ1WegrjjbZuKcikXX3hFbxc3jtSZI2yRLz1zjlKQ1Zn26/
 RIDpN/pyJnnB/BsJ0/AJZzqzAuq06lHMZvIxMc3VG3MuldGIX21hRHDjfodVKEf2DmBs
 Q1oBFO7wGq4WPAow8+Te0Nf4fT8YyurifDsxJKtvtMxs+BSL9dkMxLwVFJAiNutjUqpm
 0AHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GMsbw7TKbGGiqM/9ZPKf7oo5mFNwwzVPMoCjckGS0Ao=;
 b=FtJ4itfjFDdsh8AICCDXsFgBDxMhw3yy8PaM4NiC7l9evlh8yeJEfddIp0kTp3TMVa
 y6OB17u24KIzW6w2u2upQL8iSPST+JVSKrTaJ4epzqNoMT0gvhTlJgKpSH9/cG/21KNp
 bxhQElLc4ChOinkHLK/SZlJHBQEYGnktnCJ32EHqP7+ylVgja6zqC+hg9Y9h6Sm6pvF6
 kRVvFlThLQTeZvtIbdG3GaFaajP7qC3IvRcQ6/T9MSP9g/dDxPXOqb4084U5n8Lk9nLg
 uS4NmkTwe40YDMgvgz+M53+tTl81yMCJy3JHnAg0uSzRSfRPdIrXy88xtDK1a+mtHoSo
 0w3w==
X-Gm-Message-State: AOAM5303JTyqTNXvfT8Jo1gqDgL/syGufvp+z8eEHSwECbYjZ11TDeyZ
 x3yLLBbCPwEQnwDtBigqmpM=
X-Google-Smtp-Source: ABdhPJxgMgHwSbOWYHfWPIpoXYP3Ntpc9D+CniMEmVz0YQf3fH8iE+PsGbcJ+ZuAJ5wLCPSMdfcDfw==
X-Received: by 2002:a62:1ad4:0:b029:1ed:b92c:6801 with SMTP id
 a203-20020a621ad40000b02901edb92c6801mr3267554pfa.7.1614345259108; 
 Fri, 26 Feb 2021 05:14:19 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id j4sm9367402pfa.131.2021.02.26.05.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 05:14:18 -0800 (PST)
Date: Fri, 26 Feb 2021 22:14:16 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Keith Busch <kbusch@kernel.org>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Subject: Re: [PATCH V2 0/6] hw/block/nvme: support namespace attachment
Message-ID: <20210226131416.GA11808@localhost.localdomain>
References: <20210210160937.1100-1-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210210160937.1100-1-minwoo.im.dev@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x430.google.com
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-02-11 01:09:30, Minwoo Im wrote:
> Hello,
> 
> This series supports namespace attachment: attach and detach.  This is
> the second version series with a fix a bug on choosing a controller to
> attach for a namespace in the attach command handler.

Keith,

Could you please have a look at this series and give some comments :) ?

