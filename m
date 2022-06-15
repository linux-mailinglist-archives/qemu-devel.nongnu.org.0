Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F1654CF27
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 18:58:54 +0200 (CEST)
Received: from localhost ([::1]:60688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1WM0-0004el-Mf
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 12:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1WB1-0003sN-8B
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 12:47:31 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:43702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1WAx-0001dw-IW
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 12:47:28 -0400
Received: by mail-pl1-x62c.google.com with SMTP id r1so10874807plo.10
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 09:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=G0LiCqeElnCpyLXmWHKwsJtW7Hn/JhOvwOHGWzezT30=;
 b=jf89YWuOLXlMgZRkv9SWdlSGzsYU8v5XvZ+4aib+dRtyyqhpMIRUubKR5O8aqASYZY
 kDpLSe64H/CIEfblwSp4SXq0L68wLqJbud9nRMlBSSSLkXpO54oPZXwvu6Nw6yk5bhX3
 ZEPjuqUR3MXZ6n3ZwTQRE8tFvWmO3MgCBkW17/iInqke5GQloSp+Wf6WNqXHYe7UH5O9
 wtPL05ZpXY8hjGcYPZ2ZxvSyjSlKZjYLXoGH5OISqmtw6OfEhb7BDSfRWot7dfv3PWx0
 hHwaQzghF28GZIFXeeD5nCBe/yxwmJOFK7m84wtEf7wgiIgPEV5wrXrkHtJjQn2DyAQN
 jpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G0LiCqeElnCpyLXmWHKwsJtW7Hn/JhOvwOHGWzezT30=;
 b=LCEeibi8jVGBSxz88nzk3tnvDQ5TfGb1vClmMW1bVa/KMN/Pz8wzHcw0RaVBsMfZoP
 WXwSG/X7KfFX6qA+jJkDadJIbA6sSFhRXNq6hv8V2XPxb7K8dtPED/XXG3hiTkic6PJc
 W8/C7fY6PafAVyFNwNiJd0xxkqINlZXXKoHv0eCOBi55zNW9CkNoM46wHbW+4pDJPr2m
 fDKhbhJp0hCURe1j0fB/rFOE3ZtM92oBuP/yJzI7+KoBvOy13GBy8s+eT2wAZabnYJfh
 QP+TgCuTaA1w9lPavsk7SvKFisCIp5pQlmSUeIRh+JQqTQLqGQfzYWTQwrnYSBzcPkVd
 JbUw==
X-Gm-Message-State: AJIora9xzXdMPbpFLVdqfSG+IHHCgI5e4kRYHUa++UhNeGYZcvcBwFyF
 QLMqWQwNXNPWhKvQswxtdWI=
X-Google-Smtp-Source: AGRyM1uamxEkgsrSa3RQzA89gyKfNHOHKQhoS1wKa4ZWwbYRE4BLrlCf8eBpYI6V/rExXBr/yLzHPw==
X-Received: by 2002:a17:903:245:b0:168:e1be:f1b6 with SMTP id
 j5-20020a170903024500b00168e1bef1b6mr448358plh.19.1655311646041; 
 Wed, 15 Jun 2022 09:47:26 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 jj18-20020a170903049200b0015ee24acf38sm9471345plb.212.2022.06.15.09.47.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 09:47:25 -0700 (PDT)
Message-ID: <49bfd565-664c-ce10-ce79-f51fa9ddb3a6@gmail.com>
Date: Thu, 16 Jun 2022 01:47:20 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 4/4] net: convert to use qemu_find_file to locate
 bridge helper
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20220615105212.780256-1-berrange@redhat.com>
 <20220615105212.780256-5-berrange@redhat.com>
 <c614ed56-0c6e-e964-44a5-2b614ec3cd34@redhat.com>
 <YqnK5z5l4e9gNqeE@redhat.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <YqnK5z5l4e9gNqeE@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/06/15 21:04, Daniel P. Berrangé wrote:
> On Wed, Jun 15, 2022 at 01:42:58PM +0200, Paolo Bonzini wrote:
>> On 6/15/22 12:52, Daniel P. Berrangé wrote:
>>> +    case QEMU_FILE_TYPE_HELPER:
>>> +        rel_install_dir = "";
>>> +        rel_build_dir = "";
>>> +        default_install_dir = default_helper_dir;
>>> +        break;
>>> +
>>
>> You're replacing ad hoc rules in Akihiko's meson.build with an ad hoc enum +
>> the corresponding "case"s here in qemu_find_file().  There is duplication
>> anyway, in this case between Meson and QEMU (plus QEMU needs to know about
>> two filesystem layouts).
> 
> IMHO this is simpler to deal with than the meson additions, and also
> avoids the confusion of having files appearing in two places in the
> build dir.

Thanks to Paolo's suggestion to unify the common code to build the 
bundle tree, the required code for each bundled file is just a statement 
now (something like: bundles += { destination: source }) in the v6. 
Doing everything in Meson also allows to reuse the knowledge of the 
build tree Meson already has. I do no longer think my patch series are 
complicated more than yours. It even has less lines now.

There is still a room for improvements though. Particularly, the 
installing code and bundle-tree code are still duplicate. For example, 
pc-bios/meson.build now has the following code:
install_data(blobs, install_dir: qemu_datadir)

foreach f : blobs
   bundles += { qemu_datadir / f: meson.current_source_dir() / f }
endforeach

It would be nice if it can be written like:
foreach f : blobs
   bundle_data(qemu_datadir / f, f)
endforeach

Unfortunately Meson does not allow this.

Another problem is that the top-level meson.build is somewhat clutter. 
In my opinion, it is a persistent problem of the build system but I 
don't have a solution.

Anyway, I think my patch series is as close to the ideal as Meson 
currently allows.

The confusion caused by the files appearing in two places in the
build tree should be minimal. qemu-bundle is implemented entirely with 
symbolic links. If you know what is a symbolic link, you also know it is 
an alias and the files appear in different places, and I expect everyone 
hacking QEMU knows symbolic link.

> 
> If we really want to have the build dir look just like the install
> dir though, why write custom meson commands per file type at all,
> instead add a rule that always invokes
> 
>     DESTDIR=$(BUILDDIR)/vroot ninja install
> 
> to populate a dir that's guaranteed identical to the install layout

Unfortunately Meson cannot define a rule which will be always invoked as 
far as I know.

Regards,
Akihiko Odaki

> 
> Regards,
> Daniel

