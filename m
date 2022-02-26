Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D214C560D
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 14:12:56 +0100 (CET)
Received: from localhost ([::1]:59754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNwsY-0005LT-Ku
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 08:12:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNwp6-0003o1-IC
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 08:09:20 -0500
Received: from [2607:f8b0:4864:20::632] (port=46623
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNwp4-0004MU-N8
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 08:09:20 -0500
Received: by mail-pl1-x632.google.com with SMTP id bd1so6985473plb.13
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 05:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3luPQurcOrYas1eu8Q6q3z2pYopLEZObF7k2Bfg16hQ=;
 b=HccwY0tkVz5M0zYD2o/RzBQ07c+1FmFf68JFq6mI1819q1C7ITAxkyohnBjeQ781fq
 AvW2h8gLpN0Pow8hhf7sgZepMaE+CcUP2xtsYPEpDhXlf9RY6rUajlIAA9Lb/yBA9dS+
 Sma1vY1TGVRgCuVcFFI4xLS/D6qeJraM7F4bqUqy8E8Pfs+7gxd1S7xk3rQYS0hh4Muz
 nYcZuls3/XP1XmRThD9LLMeA2w7Ggit3B6Ji2wBpfNmE+YnDq9759rzOVtbGRCbI2hLU
 ZzMNYg79BFDWmeqaOK6M/y3WZpMlI6M1wtQSPpBrcYR7FuLl15FoH/yOlQUs09uGwXGw
 U8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3luPQurcOrYas1eu8Q6q3z2pYopLEZObF7k2Bfg16hQ=;
 b=S0Os7FxORcVT47/XV1W5SNSUqJ0KHgCCIqO5efHt/PLH7C5t60P0nouS9R8RLM2lY8
 GNnRYSrunCELDlHg00BocaaAYPLMTDkjukVp2A7PMa397MvzN5mN/3p/bgdUKpE2Azui
 v4ah0LXIzjgEtCvDDCuVUl38G1GAQJUcmOZfKAIP0hWjmOpRRlg9GHaHqRCx/AL6b33h
 jn8NGGA7zZ8SN+rC7ro9Osi0HJP65P/QUw9GPqoqbqyMBQbMHQnAgGRf+F4ceEbDggYo
 U49rp4uBxHDjvYOz4+Hga+zXmsQNXkTSb+KvRYAclx0W3X8waFtdiadmIab1iQGICLQv
 mxmg==
X-Gm-Message-State: AOAM530qvipis5o3CqEfgM+/nQLRqa0zBFfQ8H7NfOzSg0CjPDBRzUfv
 S+neP51WDYHeoVRQydLyb3o=
X-Google-Smtp-Source: ABdhPJziC/5IkXeJuTfuUSn87hQa0V1sDqTplnlWsZErSbmlrYUTyuoU8yKU9yNUcwvhkXl/tCefLw==
X-Received: by 2002:a17:90a:c386:b0:1bc:274a:c202 with SMTP id
 h6-20020a17090ac38600b001bc274ac202mr7851913pjt.185.1645880955742; 
 Sat, 26 Feb 2022 05:09:15 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001bc4ec15949sm11911725pjy.2.2022.02.26.05.09.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Feb 2022 05:09:15 -0800 (PST)
Message-ID: <d4058fc3-4d61-13bc-b6ac-3bddcb4c34fb@gmail.com>
Date: Sat, 26 Feb 2022 22:09:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/4] cutils: Introduce bundle mechanism
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220226124535.76885-1-akihiko.odaki@gmail.com>
 <CAFEAcA-XgD5yotXLc+kfv3Q0HROnb5owkyi9iZ7Ls1RLV+Jddw@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <CAFEAcA-XgD5yotXLc+kfv3Q0HROnb5owkyi9iZ7Ls1RLV+Jddw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Programmingkid <programmingkidx@gmail.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/02/26 22:02, Peter Maydell wrote:
> On Sat, 26 Feb 2022 at 12:45, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>>
>> Developers often run QEMU without installing. The bundle mechanism
>> allows to look up files which should be present in installation even in
>> such a situation.
> 
> This is supposed to work already -- it is why find_datadir() looks
> at a path based on qemu_get_exec_dir() as well as at the
> CONFIG_QEMU_DATADIR.
> 
> If you want to replace that mechanism, you need to explain:
>   * under what circumstances it isn't working correctly
>   * why we should replace it with a different design rather
>     than attempting to fix its bugs
>   * why the design you're proposing is the right way to do that
> 
> The cover letter is a good place to explain that sort of
> thing, so people understand why the patchset is doing what
> it is before they dive into the detail.
> 
> thanks
> -- PMM

datadir is only for pc-bios and does not include icons and 
qemu-bridge-helper. find_bundle is a general mechanism which can be used 
for any files to be installed.

Regards,
Akihiko Odaki

