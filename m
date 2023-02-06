Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B3168C77E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 21:19:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP7wG-0007xE-1q; Mon, 06 Feb 2023 15:18:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pP7wD-0007wv-IZ
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 15:18:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pP7wA-0004zt-3p
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 15:18:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675714681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xgh+dpZvw5MSz59ZkGJccVq3PWg73cwX3FkslOB6JYQ=;
 b=ZYyVhLxZ4QIO+K79OwJViN2Voo7YoAzXsxxTWvJ7J+Y2yXx6Vrk/xqQuQBmWhoqwkMEeo4
 wl34/hnwVpeGWj5v5HSVRkMmecuw+Bn/cDtkB/B9MmNVwEE/50VEKFbMHuL8AIE/Wto4P0
 +28mGqXfLS1jVMC4CtI+JxGB+fm5rUc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-122-G-HyvcY9Osmne_DjlyAUMw-1; Mon, 06 Feb 2023 15:18:00 -0500
X-MC-Unique: G-HyvcY9Osmne_DjlyAUMw-1
Received: by mail-wm1-f70.google.com with SMTP id
 n4-20020a05600c3b8400b003dfe223de49so6866667wms.5
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 12:17:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xgh+dpZvw5MSz59ZkGJccVq3PWg73cwX3FkslOB6JYQ=;
 b=Xl1F9jkFT7ummszPKiYtQpekIERsFAlTw7PIw1M/DrKmZ2bRkkR+aHSaJmufHDhXRG
 apq7lQEa3EuDGfZdibFnU8skKVIw7avpEgnKaoKv978i72WhUj8XpRPKBN33BlfjTz+b
 GOdDPorb3GnxzWqVz+vaqcGoOOZVDVyFsiQnNKgLTV/raHCCCe5cIuxuKFQBt/sAB0Co
 rj1iBODmPCqNpvK2KyXULgMzgpXYsgm5ZP6iY9dA7pdH3It7Pc3YPqUglDd/HTYk0B+S
 U4LfcB4NO0hwbfSeBBHTK7U/QLelFiLoOXyNzmm1/xo1YTsmq0KI88HGcVBuivc5yrfS
 GPjw==
X-Gm-Message-State: AO0yUKV1esTDGI8V91hKsl8vqlqlsUMlvb1pESHavi+4Ckbp4dXA8+11
 9wmqhV3vxvUSNPcTTkXSg2VrMB+yVDvcvXt9EUJvNh7iZGrMd0CTrohT5G1D30Pn10tDnFj7RG7
 yl3XoeVdoqRZb4wU=
X-Received: by 2002:a05:600c:1688:b0:3dd:caa8:3ae2 with SMTP id
 k8-20020a05600c168800b003ddcaa83ae2mr918991wmn.6.1675714678939; 
 Mon, 06 Feb 2023 12:17:58 -0800 (PST)
X-Google-Smtp-Source: AK7set/VhaqONFkdWZcV6elOzi3k1OVOQSFYp9iBR+pRW8EaGMeVIhDGHSwRJgXjl00KWJ3sEauQiw==
X-Received: by 2002:a05:600c:1688:b0:3dd:caa8:3ae2 with SMTP id
 k8-20020a05600c168800b003ddcaa83ae2mr918975wmn.6.1675714678753; 
 Mon, 06 Feb 2023 12:17:58 -0800 (PST)
Received: from [192.168.8.105] (tmo-096-216.customers.d1-online.com.
 [80.187.96.216]) by smtp.gmail.com with ESMTPSA id
 az24-20020a05600c601800b003dc4baaedd3sm17401465wmb.37.2023.02.06.12.17.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 12:17:58 -0800 (PST)
Message-ID: <114a7eb2-f503-361a-aac7-ad9dfa7696cc@redhat.com>
Date: Mon, 6 Feb 2023 21:17:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH 0/5] Deprecate/rename singlestep command line option
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>, Markus Armbruster <armbru@redhat.com>
References: <20230206171359.1327671-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230206171359.1327671-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 06/02/2023 18.13, Peter Maydell wrote:
> The command line option '-singlestep' and its HMP equivalent
> the 'singlestep' command are very confusingly named, because
> they have nothing to do with single-stepping the guest (either
> via the gdb stub or by emulation of guest CPU architectural
> debug facilities). What they actually do is put TCG into a
> mode where it puts only one guest instruction into each
> translation block. This is useful for some circumstances
> such as when you want the -d debug logging to be easier to
> interpret, or if you have a finicky guest binary that wants
> to see interrupts delivered at something other than the end
> of a basic block.
> 
> The confusing name is made worse by the fact that our
> documentation for these is so minimal as to be useless
> for telling users what they really do.
> 
> This series:
>   * renames the 'singlestep' global variable to 'one_insn_per_tb'
>   * Adds new '-one-insn-per-tb' command line options and a

Please no new "top level" command line options like this! It's related to 
TCG, so this should IMHO become a parameter of the "-accel tcg" option.

  Thomas


