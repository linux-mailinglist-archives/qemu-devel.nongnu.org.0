Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B13EB4DDF39
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 17:41:09 +0100 (CET)
Received: from localhost ([::1]:44746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVFf2-00012Z-Qx
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 12:41:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nVFcy-00009x-Mw
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 12:39:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nVFcw-0001ak-Uy
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 12:39:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647621538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QOKEwPMUzM2dTOM9S9DGsEgamsdS0gFVRvG91MMp6Sc=;
 b=MaF1etO8wnM8s0vDeGmMX4QAMoG8Wb6GvwrNTTfcKiyC1mH+XDnznllSBu2eG/W7E7ogt6
 qDTrYQCnacV+mi4eR6h3/Kihfm3TZ8TBIMXCxDGT9SOu8NuUWrWhh0O07QyYVABD1aSWVJ
 kOpN4lGMN7a+m85/QFdF1U6/VFctDG8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-bz6GxaKWNMG8sedgzpQM5g-1; Fri, 18 Mar 2022 12:38:57 -0400
X-MC-Unique: bz6GxaKWNMG8sedgzpQM5g-1
Received: by mail-ed1-f70.google.com with SMTP id
 d28-20020a50f69c000000b00419125c67f4so972704edn.17
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 09:38:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QOKEwPMUzM2dTOM9S9DGsEgamsdS0gFVRvG91MMp6Sc=;
 b=L7otuFgACDDUsxsohdS9KczJ9rwm32+1B4UBjxG62Li3TPilNcNbqPSKzvd71oD3R2
 VG3HGNHelmr3gfFuswGHZhvqm1T36dTndvqEjhNbQ4qAHwYA1mFWEkACjtQsfMbFYwi7
 wbWNJsJL7xuwqbXQGF4m+fHUaaNmQvVfWuaUToCqzylAXBSI/7qgn+W8kerEPPcIAE2R
 7oKG37vNkDxqdqRbyc6POhyStv/Vvwhlp1turs4YLTszWM54KHiJKKiCo0jWUe3i08AJ
 E2WVjEF64r6015uH0gNKYMv7H675AcaTay7fvdL/xB1zPz9oePO405hhVk1pZKo8jEKQ
 B+3A==
X-Gm-Message-State: AOAM5311Hwj3jm2QKleO9jvZUv7FbgP5qwaVkFbKkVpLa5Uv/s8JssR9
 OwM27Y6ZK2RgynP78i2pn5pCHYtyMqmJFF6fbULBSXch3PzOQlSvtWbo0g42cA0oRbIj6I7ao2W
 zO4703/rUeOmjkWI=
X-Received: by 2002:a05:6402:27cb:b0:416:c67f:c03d with SMTP id
 c11-20020a05640227cb00b00416c67fc03dmr10414179ede.316.1647621535791; 
 Fri, 18 Mar 2022 09:38:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzZCX66uxruYhn6Z2CFriGwZPCGaNEhCpd4XJ4CahMHYWYYVb29J9xAc59ybNXQkSrP6Bamw==
X-Received: by 2002:a05:6402:27cb:b0:416:c67f:c03d with SMTP id
 c11-20020a05640227cb00b00416c67fc03dmr10414155ede.316.1647621535514; 
 Fri, 18 Mar 2022 09:38:55 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a056402254900b00416b0ec98b5sm4415830edb.45.2022.03.18.09.38.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 09:38:55 -0700 (PDT)
Message-ID: <50be98d8-cfba-168c-1423-ce527948904d@redhat.com>
Date: Fri, 18 Mar 2022 17:38:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 00/18] iotests: add enhanced debugging info to qemu-img
 failures
To: John Snow <jsnow@redhat.com>
References: <20220317234937.569525-1-jsnow@redhat.com>
 <73e7fc10-e843-68fd-ebe3-e7916c891c34@redhat.com>
 <CAFn=p-ZXi9WG8+oMkYotxH6XdHxj+0WAVJ_zAui0R4tYTree0w@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <CAFn=p-ZXi9WG8+oMkYotxH6XdHxj+0WAVJ_zAui0R4tYTree0w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.03.22 16:08, John Snow wrote:
>
>
> On Fri, Mar 18, 2022, 9:36 AM Hanna Reitz <hreitz@redhat.com> wrote:
>
>     On 18.03.22 00:49, John Snow wrote:
>     > Hiya!
>     >
>     > This series effectively replaces qemu_img_pipe_and_status() with a
>     > rewritten function named qemu_img() that raises an exception on
>     non-zero
>     > return code by default. By the end of the series, every last
>     invocation
>     > of the qemu-img binary ultimately goes through qemu_img().
>     >
>     > The exception that this function raises includes stdout/stderr
>     output
>     > when the traceback is printed in a a little decorated text box
>     so that
>     > it stands out from the jargony Python traceback readout.
>     >
>     > (You can test what this looks like for yourself, or at least you
>     could,
>     > by disabling ztsd support and then running qcow2 iotest 065.)
>     >
>     > Negative tests are still possible in two ways:
>     >
>     > - Passing check=False to qemu_img, qemu_img_log, or img_info_log
>     > - Catching and handling the CalledProcessError exception at the
>     callsite.
>
>     Thanks!  Applied to my block branch:
>
>     https://gitlab.com/hreitz/qemu/-/commits/block
>
>     Hanna
>
>
> Thanks so much!
>
> I have more works-in-progress, but I want to be kind to your time. 
> (And tolerance level for Python.)
>
> Important:
>
> - 4 patches that switch to async qmp permanently. Almost no code, it's 
> just a policy thing, but it could affect iotests. Not for this freeze 
> now, but it'd help me a lot if you could take the time to ack it next 
> week so I can stage them and push forward with splitting the qmp 
> library out of the tree. I need to rebase and resend, which I'll do in 
> just a bit.
>
> Not urgent:
>
> - Another 15ish patches for unifying qemu-io calls like i did for 
> qemu-img here. Stalled somewhat because I couldn't convincingly unify 
> the qemu_io calls that keep the pipe open, so I will probably just 
> leave those calls alone for now, unless I get a New Idea. Should I 
> send them to the list and you'll get to them whenever you get to them, 
> or would you prefer I wait a while?

I don’t mind you sending them.

> - Another 15ish patches that split the "skip files" list for 
> pylint/mypy into separate skip-lists per tool and then drastically 
> reduces their size such that only a handful of files remain in each 
> skiplist. Same question here: Should I send these to the list and 
> someone'll get to it whenever they do, or would you prefer I wait?

Same reply. :)

Hanna


