Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 612DF26214B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 22:45:14 +0200 (CEST)
Received: from localhost ([::1]:60986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFkUL-0001uk-DX
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 16:45:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kFkTb-0001VF-Vq
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 16:44:28 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:53865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kFkTa-0001In-5h
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 16:44:27 -0400
Received: by mail-wm1-x343.google.com with SMTP id x23so280579wmi.3
 for <qemu-devel@nongnu.org>; Tue, 08 Sep 2020 13:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E3CzrOLjuFdDFXouti4VzFK/WOyzmpMOJmN8F8ta6FY=;
 b=BfDggT/JhYT8Eyt5ZRmjbnzHRLIqAou4qRuK+st2GUTMQ5enDhTVU7BDBizmWdtKjq
 YPsFNhD6qKjG9pCVhIEOnQEy7lx0fPkbwgC9AvBJJPoSXWQCE/+xOwlABMkDLJHrErPV
 kDSVqMLeSypx0escoSlQXOi50Yb7+poIhxYw0vVOE6YB/EsNPoCL5RjEJF4ca2T8TX2F
 IBV/8DiaQyY3N3RppRcBhgxAB7k0UTm31ymv6NUrTOwb1gTR5TpLgKimPhCqqm95Xz1Q
 JbRcpIjJl8gLLIl67tCHf0pwbr8rkzQahyRao+5N8WNQtWKCgRia6But+8iGQ/eDkYYP
 xakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E3CzrOLjuFdDFXouti4VzFK/WOyzmpMOJmN8F8ta6FY=;
 b=bPpowPATKhY2P7mFvSWID30zZwE5dnK+/Jza+WW+4YN3RkNpUjKOSJx4/TNbMsMMLg
 BiRvA8KvzS+KE3Vs7O8ztkQccrEimFhPlkaHBHaI4vZ8SdZ6HKFtWV8SJ/5VY0TqwySZ
 VIuDe1El/RXMDXpN0tMfQfzWvSP0S3gR2xgi+1h+i2pK45GZ2nDmiZCh8uZyqXfwBKXI
 5G/C7epALaz3NAs3vDxbW2gWe5fN7/l6hqSD2NMwAO4ceHrRgv086kt/ic1xy2bDxHti
 NE3NywK0I6QfFJpVvA07zmSLhS23/ZVARsyhBJFfJ1pVIquA8apo9fNqB3PbnppJPaVC
 bnVw==
X-Gm-Message-State: AOAM533dwhAqtfaEMgkX6svrMDw575URaTa396FNzwgsrF2K4CAcL0bH
 dVrOXG9rm6WV5SHWfoPzDFo=
X-Google-Smtp-Source: ABdhPJxgRS+SZxUTUshR901IKtoO4Jxzd2kQszPDxBW0cjqz5fW81UT4x0EYR6SSGifKj5ClhMIImg==
X-Received: by 2002:a05:600c:2283:: with SMTP id 3mr204060wmf.37.1599597864546; 
 Tue, 08 Sep 2020 13:44:24 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id i16sm782210wrq.73.2020.09.08.13.44.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 13:44:23 -0700 (PDT)
Subject: Re: [PATCH 01/20] loader.c: Add support Motrola S-record format.
To: Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>
References: <20200827123859.81793-1-ysato@users.sourceforge.jp>
 <20200827123859.81793-2-ysato@users.sourceforge.jp>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <94a12748-2333-0d09-a842-1dc1adbd1b3a@amsat.org>
Date: Tue, 8 Sep 2020 22:44:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200827123859.81793-2-ysato@users.sourceforge.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.626,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Yoshinori,

On 8/27/20 2:38 PM, Yoshinori Sato wrote:
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  include/hw/loader.h |  14 +++
>  hw/core/loader.c    | 208 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 222 insertions(+)
> 
> diff --git a/include/hw/loader.h b/include/hw/loader.h
> index a9eeea3952..6f1fb62ded 100644
> --- a/include/hw/loader.h
> +++ b/include/hw/loader.h
> @@ -55,6 +55,20 @@ int load_image_targphys_as(const char *filename,
>   */
>  int load_targphys_hex_as(const char *filename, hwaddr *entry, AddressSpace *as);
>  
> +/*
> + * load_targphys_srec_as:
> + * @filename: Path to the .hex file
> + * @entry: Store the entry point given by the .hex file
> + * @as: The AddressSpace to load the .hex file to. The value of
> + *      address_space_memory is used if nothing is supplied here.
> + *
> + * Load a fixed .srec file into memory.
> + *
> + * Returns the size of the loaded .hex file on success, -1 otherwise.
> + */
> +int load_targphys_srec_as(const char *filename,
> +                          hwaddr *entry, AddressSpace *as);

Can you add a qtest for this format please?

See tests/qtest/hexloader-test.c added in commit 645d3cbebb1:
("Add QTest testcase for the Intel Hexadecimal"), it should
be pretty trivial.

Thanks,

Phil.

