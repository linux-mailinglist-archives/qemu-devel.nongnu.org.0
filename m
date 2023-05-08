Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D34B16FB1FD
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 15:48:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw1Cm-0003sE-SA; Mon, 08 May 2023 09:47:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pw1Ck-0003rw-Hc
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:47:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pw1Ci-0002rL-MH
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:47:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683553623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ke1xrhNnR8mKTaDUI9AIQrvMArNK/hE9KTLdbjJ1ljM=;
 b=a7M2T5mMjd5h/E5OHn+C2qVYizRVIAZnsD2pznG5AQgH5nNGirRR5zNLb27mG5Ay/VI3/7
 oj7kXpmxPDDsUPilikvC2rVQBsjBcnL0SgV69sw91/7uDQfbza3RVj7VWP2k8cwqe0usfc
 03QTHwfMJwi7W+VNFwQra0OTTLj91K8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-BymN__a2PwGhhFcCDMfujg-1; Mon, 08 May 2023 09:47:02 -0400
X-MC-Unique: BymN__a2PwGhhFcCDMfujg-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-30629b36d9bso1691136f8f.0
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 06:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683553621; x=1686145621;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ke1xrhNnR8mKTaDUI9AIQrvMArNK/hE9KTLdbjJ1ljM=;
 b=RzjF36m0a4ciNTCD/TpbcX/8eJ1eXeax39e0rc94OmJZqz89oIthkOVH6/933D88oG
 aYcB/rnbnQXW87w0pFIr1g2wveYAkopDJMR21zhNSLTyHZjVKiQ7sFFKzZxFHDUsUMjE
 xWFiesOB9GUgy8SgEt/a7FbHj+Imn+fviTtsVD/EF7B+IEjsEAYEzRGjgHCrQS4yAyzX
 89OqoUY+kSOTEqAC+5WV3RwVlpoEJRBp9uHgE92hQBXsF254PqJdRFtR1ToDsG2V/b2D
 CsSFe051hRUKgBeTm6dx/fLkTRREROB10a0vJZyhBDNtMxF8XSTHbRd2sEERjYJtk8U5
 yTdQ==
X-Gm-Message-State: AC+VfDwshKya2aoCR7eGBZN1uTKI0fNE61ScFTlqSuDJEktHfnOkiLUw
 o82d2OWc+wyY/P1JDc5/QGK5CqqUC67arSTKkW0UnYmwOjhAJiw3ttFUG/xGtxj4391O1Jgus8g
 Sqad34RSFbsqDGMA=
X-Received: by 2002:adf:e342:0:b0:307:7d1a:20ea with SMTP id
 n2-20020adfe342000000b003077d1a20eamr6955476wrj.42.1683553620990; 
 Mon, 08 May 2023 06:47:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7fALuHt/ADrnBUtESDz6cwFXfUZLRuotp3uIrg+tq4Z/2xr7smkBpD9UQ6eQUpJhPg33KrXw==
X-Received: by 2002:adf:e342:0:b0:307:7d1a:20ea with SMTP id
 n2-20020adfe342000000b003077d1a20eamr6955457wrj.42.1683553620677; 
 Mon, 08 May 2023 06:47:00 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-212.web.vodafone.de.
 [109.43.179.212]) by smtp.gmail.com with ESMTPSA id
 s5-20020a5d4245000000b003078d45929bsm6338429wrr.58.2023.05.08.06.46.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 06:47:00 -0700 (PDT)
Message-ID: <edf65197-a4bb-96c3-c137-2b43b901aae4@redhat.com>
Date: Mon, 8 May 2023 15:46:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 1/1] util/async-teardown: wire up
 query-command-line-options
Content-Language: en-US
To: Claudio Imbrenda <imbrenda@linux.ibm.com>, pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, david@redhat.com, borntraeger@de.ibm.com,
 frankja@linux.ibm.com, fiuczy@linux.ibm.com, pasic@linux.ibm.com,
 nsg@linux.ibm.com, berrange@redhat.com, alex.bennee@linaro.org,
 armbru@redhat.com
References: <20230505120051.36605-1-imbrenda@linux.ibm.com>
 <20230505120051.36605-2-imbrenda@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230505120051.36605-2-imbrenda@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.802, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 05/05/2023 14.00, Claudio Imbrenda wrote:
> Add new -run-with option with an async-teardown=on|off parameter. It is
> visible in the output of query-command-line-options QMP command, so it
> can be discovered and used by libvirt.
> 
> The option -async-teardown is now redundant, deprecate it.
> 
> Reported-by: Boris Fiuczynski <fiuczy@linux.ibm.com>
> Fixes: c891c24b1a ("os-posix: asynchronous teardown for shutdown on Linux")
> Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> ---
>   docs/about/deprecated.rst |  5 +++++
>   os-posix.c                | 13 +++++++++++++
>   qemu-options.hx           | 34 +++++++++++++++++++++++-----------
>   util/async-teardown.c     | 21 +++++++++++++++++++++
>   4 files changed, 62 insertions(+), 11 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


