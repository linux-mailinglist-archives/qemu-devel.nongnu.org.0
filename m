Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8023A6921
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 16:37:56 +0200 (CEST)
Received: from localhost ([::1]:37320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsnit-00022o-Sg
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 10:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lsnhd-0000C0-Uk
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:36:38 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:33503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lsnhc-0000hm-69
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:36:37 -0400
Received: by mail-ej1-x634.google.com with SMTP id g20so17171272ejt.0
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 07:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pxNyhCa6Aqsh6ZYzqJBtOnJT3XEIbSUucwco7NQ2Xt0=;
 b=KRoo0DqbqupQt8UX+mwPscTGmQrYxVPHLdADEUiHqFpnVCfF+RFQjrJ7AT0vNs/RsD
 oXMD9QWiCBJNYOQJ9yVrt9dF/dQ3iyyteUikkl9WrzqPdM0Ktc0+nUvnjEvli0wIMymu
 U/Ao5GOn3ERAXvlspC0FCL/SJUD5TIYWFTwuGqIi5EE4rJREfe8iK+xo/JrUJvVVebRb
 il2bgX+8Ra8qsGa9nNq6wyZYm3qSxV6bEA3fqX/oDVnUQDL/V87Kh1JgSfY33rqGr9aa
 EAbzYRd80dR50CYY2umsaxeVEqPiBBXXR2/en+Q4U3Pq2yurM3HMUmmflc32t2swoI/b
 o0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pxNyhCa6Aqsh6ZYzqJBtOnJT3XEIbSUucwco7NQ2Xt0=;
 b=tt1wqgh37Kt0SqivnHQa9UFe4o/maRt4wztM9e3xWX7FhdvxqrakHyELBl4IGtFq+E
 VLm9tStXYUvwHzvL1NJQIaHFZ1viWQZIX5SIfO+K/Hfdj/Qwx5vJkOOJ8O6OmL3p/Db0
 DhlgW3haeXDl+rWEjLXQ8BiARHTrbwoXeFsLtJ/cHhJt0DsEJDKjVJNVgq3BmT69lt15
 WXdGlePCypRknvdoW/sDQzOlD8q6QzSYHjzAR/EbSpXsSBQ9mTwyckvXwK7LdarLrNwr
 9hGK+hXx4e3rKYedWEw5tjHoI+fOVyNBv2XjYDaL4T1wYd6cl3ul7RqBE9kBtSdt8DYB
 TLXA==
X-Gm-Message-State: AOAM532fIX9btGwSfQctz78fW8aFRoUCw3jtXii3uO6a2hfS1Pxtqfjb
 ABMlEfibY3SJ1f+s7QA43Sx2KIVEXAY=
X-Google-Smtp-Source: ABdhPJzhRFxeDz9lfilJ0CqSd/QoNIL55Ag/gQl0WIn1u86Nf+IK3VeYPDBrTL4BKWof6b9n0wff+w==
X-Received: by 2002:a17:906:744:: with SMTP id
 z4mr15793300ejb.347.1623681394635; 
 Mon, 14 Jun 2021 07:36:34 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id b14sm7281883ejk.120.2021.06.14.07.36.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 07:36:34 -0700 (PDT)
Subject: Re: [PATCH v2 03/18] modules: add qemu-modinfo utility
From: Paolo Bonzini <pbonzini@redhat.com>
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20210610055755.538119-1-kraxel@redhat.com>
 <20210610055755.538119-4-kraxel@redhat.com>
 <20210610130424.fj6fsufnunccmhmx@sirius.home.kraxel.org>
 <YMIP/cKc570Ozvdh@redhat.com>
 <1636b96e-9073-b145-3fcc-3370fa2d7506@redhat.com>
Message-ID: <8b860457-7c51-f4cb-1e80-02848ad92648@redhat.com>
Date: Mon, 14 Jun 2021 16:36:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1636b96e-9073-b145-3fcc-3370fa2d7506@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.489,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/06/21 10:34, Paolo Bonzini wrote:
> - modinfo.json needs to be disabled on non-ELF platforms (x86, Windows). 
>   One alternative is to use libbfd instead of including an ELF parser.
> 
> - If modinfo.json has to be installed, you need to build modinfo for the 
> build machine in order to support cross compiling.  That however would 
> require a cross libbfd, which is a pain.  Do you really need to install 
> it?  Can the functionality instead be included in the main QEMU binary 
> with a query-modules command or something like that.

Another possibility to eschew .o parsing is to add something like this 
to the sources

#ifdef QEMU_MODINFO
#define MODULE_METADATA(key, value) \
    =<>= MODINFO key value
#else
#define MODULE_METADATA(key, value)
#endif

MODULE_METADATA("opts", "spice")

A Python script could parse compile_commands.json, add -E -DQEMU_MODINFO 
to the command-line option, and look in the output for the metadata.

Paolo

