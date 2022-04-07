Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D153C4F8033
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 15:11:42 +0200 (CEST)
Received: from localhost ([::1]:58386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncRvJ-0007YY-VS
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 09:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1ncRsL-0005Tr-IO
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:08:37 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:38902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1ncRsK-0004hN-4l
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:08:37 -0400
Received: by mail-lf1-x132.google.com with SMTP id b21so9530295lfb.5
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 06:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=q+5cJe35LlVpHhDGm0Y9QvkRyT5mh++IJWoqGaDyK+I=;
 b=bQ7hbnG7g8L0IrkQIIb5P+NrzHZNuY4ht7uDL731R4OPkG1hCAKH4RTTnpAPQ7hFHn
 QWDDLSKAn0CVj8DxRqnKWCkHEmgPXjP+G67T46/sjHg9kg+CXbgv+xWGbi430i9GHJ9V
 nuY+ETPfcUnjTjwJ3aAv6lhUgtVPitU2T9e8Dsl7pShM13eY5yYHDn6hgg1FfNu7W0xW
 47zVAW/eaNK2t0x2X6NaeuzNXYxS6UJqBlzJLGoMWsgCWUYauqsn9Hvaf51ssudBs8ue
 jpFsQd+amYDfL9S3+1HkVyWkUUbMZc7tJ521ilB8EkGtsUlLrw7/St5nA1QCbKTuTqq9
 mggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=q+5cJe35LlVpHhDGm0Y9QvkRyT5mh++IJWoqGaDyK+I=;
 b=KWwADaI/EWTSrlOEd6rrA6rV6IBYc/jsdrCH2EvANX3ma/p3udcM7gzwKAOE31yy6i
 1kMvmDrRede9m3vNHPos46Yi30aueI7c09RwxmhJRi8he2RdjeENOSQZVy+IscNp4wOl
 9qogXxvT2cwUAPY+qt4Rm4mxUn+WYSKRZnCEYAxILyJXC/dRdij3tKkJCLYSSCzlNy11
 MhLq3IjW/gNuuE07AQv/etkP4QmQEUODArTAnR/rjvcYNsvRYOQOBY8QG5CQVh/jWXc7
 SPcAZbrkYArqxa6Lwf0iQRQL3fvDV/kb9o8czNo/dm5LVpLD+antKckozqeqHDoFMvw0
 AQcg==
X-Gm-Message-State: AOAM533hLbZFB1utMMLBhe8eMpy1xhfIDEblxCEdBeE8riNw5n0PU3eE
 AKRzbJgCwftLLr4Fn0P9NHU=
X-Google-Smtp-Source: ABdhPJzwzrNSGZDvIeeJpEBueip63Mr9P+k3lFGCQeLjK6W7tUkVsjuzc6N23afWegjLdeEp7iuIFA==
X-Received: by 2002:ac2:546f:0:b0:44a:5ddc:f614 with SMTP id
 e15-20020ac2546f000000b0044a5ddcf614mr9502741lfn.519.1649336914473; 
 Thu, 07 Apr 2022 06:08:34 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a05651c158e00b00247fda7844dsm1946941ljq.90.2022.04.07.06.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 06:08:33 -0700 (PDT)
Date: Thu, 7 Apr 2022 15:08:33 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [PATCH v2 5/5] machine: remove temporary inline functions
Message-ID: <20220407130833.GF3143488@toto>
References: <20220331115312.30018-1-damien.hedde@greensocs.com>
 <20220331115312.30018-6-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220331115312.30018-6-damien.hedde@greensocs.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 31, 2022 at 01:53:12PM +0200, Damien Hedde wrote:
> Now we have renamed all calls to these old functions, we
> can delete the temporary inline we've defined.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>


> ---
>  include/hw/boards.h | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 1814793175..7efba048e9 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -52,11 +52,6 @@ void machine_parse_smp_config(MachineState *ms,
>   * it will get an error message.
>   */
>  void machine_class_allow_dynamic_device(MachineClass *mc, const char *type);
> -static inline void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc,
> -                                                          const char *type)
> -{
> -    machine_class_allow_dynamic_device(mc, type);
> -}
>  
>  /**
>   * device_type_is_dynamic_allowed: Check if type is an allowed device
> @@ -72,11 +67,6 @@ static inline void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc,
>   * Note that if @type has a parent type in the list, it is allowed too.
>   */
>  bool device_type_is_dynamic_allowed(MachineClass *mc, const char *type);
> -static inline bool device_type_is_dynamic_sysbus(MachineClass *mc,
> -                                                 const char *type)
> -{
> -    return device_type_is_dynamic_allowed(mc, type);
> -}
>  
>  /**
>   * device_is_dynamic_sysbus: test whether device is a dynamic sysbus device
> -- 
> 2.35.1
> 
> 

