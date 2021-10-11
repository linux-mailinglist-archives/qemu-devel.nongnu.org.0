Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D2042921C
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 16:38:16 +0200 (CEST)
Received: from localhost ([::1]:41228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZwRS-0002Xl-Tf
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 10:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gsomlo@gmail.com>) id 1mZwPV-00016G-SP
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 10:36:14 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:44781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gsomlo@gmail.com>) id 1mZwPU-0001FD-CD
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 10:36:13 -0400
Received: by mail-qt1-x832.google.com with SMTP id r16so16531171qtw.11
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 07:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :in-reply-to; bh=OFPjncNKcFa1uoibtjUN2TZCnZurHkPVpnRywtKazRs=;
 b=Ytz9vTJB2WRpqLxDrVKqNRY3MyunHRC3AY3E+tSCf1g/jJLVgRayE1Cg0T240siS+U
 aytVsYW4qo3Pc6Ir6IKb7VjKUWThDKXCMVYboaoTXCI7u32FWERfPPCoGFf+3ut0+1SN
 CO4gMVonG2jnp2Tnd0pyT6KhPk3dfRp8ZZuuufvfKURmxVXdZVFIYN826h8FWwWW87Vu
 7DD4VaqaWuT2sWRjCoVGeFfhuYRtLjIgglBrha1bEXwu9ElgQlhIQeUX1JFMTWHfa/Wr
 BRMww4tElO/Bd/UaSRRlGKEMa2PrBLCYYsNvOLkNVybsU9BLQ7pEOxn3F7l0SkRO3baW
 G1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:in-reply-to;
 bh=OFPjncNKcFa1uoibtjUN2TZCnZurHkPVpnRywtKazRs=;
 b=7ApqkjZ3HnE+EZRs8Dr9tNFY8RvvHi5sCtUjKrjCi54wfERpTZyxeN3yT/EhZgsviy
 E6AbjAliFUIaid9f7yR8QrE3E7D3XfX3r4l1/DeoxKI7HtMkN5F5zD1WMexPSoKFoFCi
 Dvc9LceU7KQpcrLs+g0ZZ465CG9sAh/TUF/K9vfs3KE5jG/FnzPrh0eUMdMWMbF5165G
 LJ/6E3jMaxt/Ca7iU6kBgwLXu5nlPfJ0KOybOu6FdDsIE5s2ZV/S5VNKxe2zFdqwSbhx
 gqFty8h7yfTXq3JxbNyoXHaXx1Ooot4dMznxvsSsmfSydvJ4uF9U3HXSwMK6v8m/2tzX
 ZROA==
X-Gm-Message-State: AOAM531+a+eJBv8SoJqRr7iMb7TMqhNqOFHMsJ9k+dW+EaDsYJo904xu
 ntMuupN27HFx/qWNyxZx/jU=
X-Google-Smtp-Source: ABdhPJw284Sz7PP8B1J6RfVW2XY9visB/1yzn63erp5di+o9WF4Dh0InlO/ARfTixHy4exKnVEDyxw==
X-Received: by 2002:a05:622a:11c9:: with SMTP id
 n9mr15517595qtk.295.1633962971413; 
 Mon, 11 Oct 2021 07:36:11 -0700 (PDT)
Received: from errol.ini.cmu.edu (pool-108-39-235-221.pitbpa.fios.verizon.net.
 [108.39.235.221])
 by smtp.gmail.com with ESMTPSA id g13sm4297273qkk.22.2021.10.11.07.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 07:36:10 -0700 (PDT)
Date: Mon, 11 Oct 2021 10:36:08 -0400
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH] hw/misc: applesmc: use host osk as default on macs
Message-ID: <YWRL2DmlJK3yjV8c@errol.ini.cmu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5ab8786-bec9-b551-bf22-ef1bdace3f2b@eik.bme.hu>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=gsomlo@gmail.com; helo=mail-qt1-x832.google.com
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
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Pedro =?iso-8859-1?Q?T=F4rres?= <t0rr3sp3dr0@gmail.com>, rene@exactcode.de,
 "Kiszka, Jan" <jan.kiszka@siemens.com>, qemu-devel <qemu-devel@nongnu.org>,
 "Graf, Alexander" <agraf@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 suse@csgraf.de, afaerber <afaerber@suse.de>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Oct 2021 15:40:07 +0200, balaton@eik.bme.hu wrote:
> I guess a frequent use case for running macOS guests with keys from host 
> would be on hosts running macOS too so a solution that works both on macOS 
> and Linux might be better than a Linux specific one which then needs 
> another way to do the same on macOS. Looks like there's free code for that 
> too and you don't have to convince a maintainer either.

I mostly agree with you (hadn't given much thought to qemu on macOSX),
with the small caveat that (on Linux) you'll end up racing the kernel
applesmc driver for access to the physical hardware; not sure whether
you'd run into anything similar on host-side macOSX as well, never
actually used it much as a developer... :)

Cheers,
--Gabriel

