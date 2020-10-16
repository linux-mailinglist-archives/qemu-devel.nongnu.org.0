Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E057290B23
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Oct 2020 20:09:52 +0200 (CEST)
Received: from localhost ([::1]:52876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTUAo-0001XZ-Kg
	for lists+qemu-devel@lfdr.de; Fri, 16 Oct 2020 14:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axboe@kernel.dk>) id 1kTU8Z-0000jO-6l
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 14:07:31 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:46392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <axboe@kernel.dk>) id 1kTU8T-00062i-PW
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 14:07:28 -0400
Received: by mail-pg1-x52e.google.com with SMTP id q21so1888958pgi.13
 for <qemu-devel@nongnu.org>; Fri, 16 Oct 2020 11:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GJ0kW23Ft7kWH2L+opK74RczYd3mTtbU1W4ReHf2wes=;
 b=XY5Y7p5QtxRuSw0s8op8laLGN1x/0bHaeejX4lFztMjppPwiehLWiY2y+X17MyA/YX
 W4aagBo/SZFPaVx7CjuCWTqzaFGJ8ekZiPC7AfEVSeKT301Mk2c8zm5eRkrcLZmOL1cD
 33s7QxQzaTbSyB/ak/9eSkQQJHF0e4XB+F9p6/UmioVNNjbv923RXtXWlnwL7bnSWgPE
 MrQUP4DedDsJpztWyEWi7bd7TENuLPy/wyx+rg0OMxjlez6RhBd79ccI/+NpgqoIYJfj
 8NRjIkim8/UahBCMNW7UaPMuvIgGK87ykuVo/czcznvz5K5RAho2kTvqO2Q2IFskPne2
 1+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GJ0kW23Ft7kWH2L+opK74RczYd3mTtbU1W4ReHf2wes=;
 b=Zf9mxb4zyCfhK8G9bLaQzNgT51lXprS105Dmae8E7dicC0ThG5ho8wHIYrTHxjrtwD
 g/RyZBUJ7hF/8GPAeP+gU+GgHiTWmmMklBak4BUQSRl1gVSzLhOUjI4htdejDCT5cvZP
 yWS0CBApmXfUnPm7GMe2ZzWXfu27a8p9QkxsMtfxd82OYvJoxK2pTXn1w4+6Yyqt8+/3
 gT8SjQpYtm3DHMMKawJuphebEkN4nwF4GHRM7GINZ/ooLwHyDJfRpPMQZ5O7lIDc2v3S
 k2W2wIOzCkl/Kwb6xwQSo4yAM/JYWstwXeY8t7D+p+pucdYiFFlXDdm4eUnR8M+tdRLw
 UmxA==
X-Gm-Message-State: AOAM53349FxkGW0YU49ESeEuxCCG/mYvyKG/A01j7Pbju+thDHkplM/4
 kFVqbjMwG+Z/odx5O5E/qVtyXFk89acWUgh7
X-Google-Smtp-Source: ABdhPJyttTkUxmZoD0Pgnp7k3WrSY+ASrIX7oi3nhBE1KZq63c5P53fwgPS446EK0NGdb83pMsrmdA==
X-Received: by 2002:a63:5b60:: with SMTP id l32mr4300008pgm.134.1602871642764; 
 Fri, 16 Oct 2020 11:07:22 -0700 (PDT)
Received: from [192.168.1.134] ([66.219.217.173])
 by smtp.gmail.com with ESMTPSA id c21sm3609040pfo.139.2020.10.16.11.07.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2020 11:07:22 -0700 (PDT)
Subject: Re: io_uring possibly the culprit for qemu hang (linux-5.4.y)
To: Ju Hyung Park <qkrwngud825@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <CAD14+f3G2f4QEK+AQaEjAG4syUOK-9bDagXa8D=RxdFWdoi5fQ@mail.gmail.com>
 <20201001085900.ms5ix2zyoid7v3ra@steredhat>
 <CAD14+f1m8Xk-VC1nyMh-X4BfWJgObb74_nExhO0VO3ezh_G2jA@mail.gmail.com>
 <20201002073457.jzkmefo5c65zlka7@steredhat>
 <CAD14+f0h4Vp=bsgpByTmaOU-Vbz6nnShDHg=0MSg4WO5ZyO=vA@mail.gmail.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <05afcc49-5076-1368-3cc7-99abcf44847a@kernel.dk>
Date: Fri, 16 Oct 2020 12:07:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAD14+f0h4Vp=bsgpByTmaOU-Vbz6nnShDHg=0MSg4WO5ZyO=vA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=axboe@kernel.dk; helo=mail-pg1-x52e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.253, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: io-uring@vger.kernel.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/16/20 12:04 PM, Ju Hyung Park wrote:
> A small update:
> 
> As per Stefano's suggestion, disabling io_uring support from QEMU from
> the configuration step did fix the problem and I'm no longer having
> hangs.
> 
> Looks like it __is__ an io_uring issue :(

Would be great if you could try 5.4.71 and see if that helps for your
issue.

-- 
Jens Axboe


