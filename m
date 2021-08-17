Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9D63EEB88
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 13:21:45 +0200 (CEST)
Received: from localhost ([::1]:49714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFxA7-000491-F0
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 07:21:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFx8M-0002Ov-JP
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 07:19:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFx8I-0002oN-ME
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 07:19:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629199187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bisbwlxEz52RGcOCcMTx4GFi829KiKDZdm3MHAUYnQc=;
 b=D3bVHNc1PXlWvjelYhb0qy6VVtKilpl1QkC3IrmrwhoT2BJYRYvDBW6DgPDqslrYF3mXZ9
 mYY8D1itNtc3LRAMKAoOwwJsTgLNkjAH3LyA97avH37LEdFg9QdYP+a3CaRE9tjd87nbJh
 3YuGqPqk6r5peR26O6sBZX4S6YTEGno=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-SHVSHOSVNm6ANCori3lwvQ-1; Tue, 17 Aug 2021 07:19:45 -0400
X-MC-Unique: SHVSHOSVNm6ANCori3lwvQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 z15-20020a7bc7cf0000b02902e6a68ffd3cso713270wmk.2
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 04:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bisbwlxEz52RGcOCcMTx4GFi829KiKDZdm3MHAUYnQc=;
 b=io4lMft5+3kkNrBu/JjgtKs/084C0Qtc4JZb5vvN7qEc4e+C2Ymadv5Ci8sBQRzf+Q
 6bWYxGJkGWPTFO3s49ar56Xjwvr1PerkME5tdGiJ6dpuvdbdHwYxvn//TzlwXmtZ1mci
 XPFgL7jHJpbQnsmzAdTbmAMBSCGzlONKpxCU57FZD+yuTTIB7ttD9pAvCtKx3Di/4AvL
 jZAgVWrEA01OAsop6qJwLDMikuj/aHiObB4cgLT2hnzmKzx6wWcYoRpkk6wHqI33rbAB
 ndWuIFVihvbkqh5mcyu8ntdN/U/JjpY8EolWGzJsnDmmFkDRy0WqTIDfemKBCviELCyW
 ONPQ==
X-Gm-Message-State: AOAM532KCYG/IhduPkzdiZaixjfvYGpsVqPp1J8YQUFAgfljJ8tm5qRs
 s5d4A8ZbDVk3xIuY9G/DfjFGxuiyXlNdWQmigE2TapuZkm+R+ytlENIo2JmCoBules93rHhG/pn
 k28wbfB1fSer3vRI=
X-Received: by 2002:adf:a41d:: with SMTP id d29mr3361752wra.297.1629199184853; 
 Tue, 17 Aug 2021 04:19:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXlV68JL8QYJaRREGCQi7L4seC1mdwt2IXjM2+zCVOocUUCiU5yD2W2l4gSOdWHcuZHiXrEg==
X-Received: by 2002:adf:a41d:: with SMTP id d29mr3361721wra.297.1629199184493; 
 Tue, 17 Aug 2021 04:19:44 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id z13sm2081955wrs.71.2021.08.17.04.19.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 04:19:44 -0700 (PDT)
Subject: Re: [qemu-web PATCH] (typo)
To: adam.s@Safe-mail.net, qemu-devel@nongnu.org,
 Qemu-block <qemu-block@nongnu.org>
References: <N1M-F0ZZCF3yks@Safe-mail.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3945d539-dc7d-1c41-8de2-4935a0c0b3fa@redhat.com>
Date: Tue, 17 Aug 2021 13:19:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <N1M-F0ZZCF3yks@Safe-mail.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.961, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/19/21 12:54 AM, adam.s@Safe-mail.net wrote:
> Hello,
> 
> Sorry I cannot use github/gitlab.
> 
> I'm new to QEMU but I found this typo (mismatched braces) in the *installed* HTML manual:
> 
> In: "file:///C:/Program%20Files/qemu/share/doc/tools/qemu-img.html"
> This should *not* have ending ']':
> 
> measure [--output=OFMT] [-O OUTPUT_FMT] [-o OPTIONS] [--size N | [--object OBJECTDEF] [--image-opts] [-f FMT] [-l SNAPSHOT_PARAM] FILENAME]

I understand this as two possibilities, either '--size N':

  measure [--output=OFMT] [-O OUTPUT_FMT] [-o OPTIONS]
          --size N

or the rest, ending with FILENAME:

  measure [--output=OFMT] [-O OUTPUT_FMT] [-o OPTIONS]
          [--object OBJECTDEF] [--image-opts] [-f FMT]
          [-l SNAPSHOT_PARAM] FILENAME


