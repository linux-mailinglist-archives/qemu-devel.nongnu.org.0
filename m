Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 791DC42F21C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 15:25:47 +0200 (CEST)
Received: from localhost ([::1]:33060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbNDW-0001K8-Fn
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 09:25:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mbNC3-0000Km-Qm
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 09:24:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mbNC0-0008FQ-NT
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 09:24:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634304251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U7I8luzIRWK4wc+yKfCzAoKtKuPvHMHsZ1AEMCK+Ij0=;
 b=av1YZM7JLDhhUtlDr2zlB2HoLjGvCbkh6JmnsdFkEXE2woTkPogB660m/voH67NR8YDVnK
 xK7fVJZuxm9bpo4fo6JN2biuEszkAYSK9Wo5LXVrsFKlCcrnwzLnnpJn+CIAQ+Oomxvjb7
 CYf0HCTY/hOwxjTXWLP6xXdGFHFAbco=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-JbdHcHyhNuOmBOtO_POiRA-1; Fri, 15 Oct 2021 09:24:10 -0400
X-MC-Unique: JbdHcHyhNuOmBOtO_POiRA-1
Received: by mail-wr1-f70.google.com with SMTP id
 s1-20020adfc541000000b001645b92c65bso703119wrf.6
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 06:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=U7I8luzIRWK4wc+yKfCzAoKtKuPvHMHsZ1AEMCK+Ij0=;
 b=iadD+E4OkTiI7cZ6cRumBzZPGTuYjunNdbKIueVxLPyuySMe5qBX4fg2g+3nmYENh9
 EMmAFDLelUzayxrlPRf8AP5u0tsinMZtIfjRHR1lX9kNlh45s6gbksIQPBG2KNFrUXw+
 K4uwqREKRswjHbN8Od8xHb9HoKQT2105O+kA3Ym0/r7LB0bSHvhSnohBMk9LHs/KNwgt
 SfenqzZgJlnHD9iDfe8EoIlDrZEaKNl/KyC3M2D+twKnoPdv64o/HbXTrUDzJDDn0Prr
 0wAwg5/m4dtOt9nuQOqEchvynpY2Oo7dc4CQq6xCuUtLXcLWNjdMMbGsh7w85YOW5Zb0
 Xb1g==
X-Gm-Message-State: AOAM533YQrG1bE5ilhHgrO4PfIDWN30qUXP+ZJMD17E0+nQBrNU+sMKS
 TMwsjqlS24Ri2KtvZZ/DMMMfi8U/pKXfbrPsoZid8TSTVmd9qhoFZBl0sujF+MkVM1PyqBFvsGo
 RRdYAf7MQPOL21uA=
X-Received: by 2002:a05:600c:2044:: with SMTP id
 p4mr12184413wmg.53.1634304249040; 
 Fri, 15 Oct 2021 06:24:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8AaD2VMHZB1xbQ5zqDC88XgtBqFnnKP9zDXXg0ABjGP/asal1Q3h9TZX16wJ73CWepNh69w==
X-Received: by 2002:a05:600c:2044:: with SMTP id
 p4mr12184393wmg.53.1634304248865; 
 Fri, 15 Oct 2021 06:24:08 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id 143sm11004145wma.37.2021.10.15.06.24.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 06:24:08 -0700 (PDT)
Message-ID: <2a969cbc-402d-330a-1ef2-942832f1ac1d@redhat.com>
Date: Fri, 15 Oct 2021 15:24:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/2] analyze-migration.py: fix a long standing typo
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20211015131645.501281-1-lvivier@redhat.com>
 <20211015131645.501281-2-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211015131645.501281-2-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-trivial@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Eduardo Habkost <ehabkost@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/15/21 15:16, Laurent Vivier wrote:
> The parameters of '-d' can be either 'state' or 'desc', not 'dump'
> as it is reported in the error message.
> 
> Fixes: b17425701d66 ("Add migration stream analyzation script")
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  scripts/analyze-migration.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


