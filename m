Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 238DC4D2E69
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 12:48:45 +0100 (CET)
Received: from localhost ([::1]:52134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRuo8-0002Q8-5v
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 06:48:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nRuPl-0005Lv-8O
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:23:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nRuPj-0007fs-QJ
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:23:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646825010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MhTmGxdc9YtrsQu9nqek3Bhv3vHC4RjciaOF4IbcimY=;
 b=DXcSmCJuwRIzIkZr6Uj8zLfUyDBFRkr1M/+k4QMjZ9TDJ7+a8tQmiIIc2SHR+p2Nm4hKAJ
 AwyzapgI0wSRknvXUANf30g6eN1LsFns2K4xMR3LR/bs3JLg+4llOz9bni5ZkPlsXdooXM
 Al4dLEpElMla1PWY2zdltTDiIBxY+oE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-37K6TylmPliuCrC9KOWP4A-1; Wed, 09 Mar 2022 06:23:29 -0500
X-MC-Unique: 37K6TylmPliuCrC9KOWP4A-1
Received: by mail-wr1-f70.google.com with SMTP id
 w17-20020adfec51000000b001f068bc3342so657846wrn.6
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 03:23:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MhTmGxdc9YtrsQu9nqek3Bhv3vHC4RjciaOF4IbcimY=;
 b=NVwRiEdmrGttmYDk4t2thAR0g/KOBzzWj1ohZuSwX22KHMx9/LslPq9TF+BUU2MBH6
 8ns7GKl8Ptd/naMoGnvzOCzqpysEhBVVrfT20+PLRgjvnrMWCZ3VDsYv8tdYo+pJFwgI
 Bhrc1eI4RF5S3Dmc+1qMl41Z+/05uN34lMDkDLhF06FjLZpUjag1kKfnNQWQ5VAi7Q8f
 6drgtlnRa5X73WsTPgFbVABTgY/6lalzkO8n3ByY2ckEhqL74YxP9qrTla4Ya/sH/19C
 c0S2QI/qAZaxnLzcZctefs8Ud4EgEzmOPp5TGcCKFjSC7+AuMC6V8UGgjS/zCbQrzNRp
 kshQ==
X-Gm-Message-State: AOAM532HR3TdGLI8Oqzi+QB1PIV1I5qri0wmNCHn4Uaga5AJv12HeIow
 osklSvWzNZzUGTWeRHQEtjiNURPf1ga3b0juTqaK1Fkt94WEMAWVin56YYQr3yNHBMSgHk9dp+h
 3m+S3+K+JRGRlSYQ=
X-Received: by 2002:adf:e98d:0:b0:1f1:5d2b:eee6 with SMTP id
 h13-20020adfe98d000000b001f15d2beee6mr15280233wrm.143.1646825008626; 
 Wed, 09 Mar 2022 03:23:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkpqOPFv3YbVcBrQsnBEH767ogUQFgDR55hSbPrbh2V4oxuxrkjOFEWwy9AkPB5B2d3a/lPg==
X-Received: by 2002:adf:e98d:0:b0:1f1:5d2b:eee6 with SMTP id
 h13-20020adfe98d000000b001f15d2beee6mr15280219wrm.143.1646825008377; 
 Wed, 09 Mar 2022 03:23:28 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:6300:8418:c653:d01f:3bd2?
 (p200300cbc70763008418c653d01f3bd2.dip0.t-ipconnect.de.
 [2003:cb:c707:6300:8418:c653:d01f:3bd2])
 by smtp.gmail.com with ESMTPSA id
 z2-20020adfec82000000b0020372dcab56sm1387796wrn.112.2022.03.09.03.23.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 03:23:27 -0800 (PST)
Message-ID: <793316ee-f2e0-ee4f-a8b0-03d975b9cab6@redhat.com>
Date: Wed, 9 Mar 2022 12:23:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH] tests/tcg: drop -cpu max from s390x sha512-mvx
 invocation
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220309112248.4083619-1-alex.bennee@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220309112248.4083619-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.03.22 12:22, Alex Bennée wrote:
> With -cpu max we get a warning:
> 
>   qemu-s390x: warning: 'msa5-base' requires 'kimd-sha-512'.
> 
> But dropping the -cpu max and it still runs fine.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Thomas Huth <thuth@redhat.com>
> ---
>  tests/tcg/s390x/Makefile.target | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
> index 257c568c58..7aa502a557 100644
> --- a/tests/tcg/s390x/Makefile.target
> +++ b/tests/tcg/s390x/Makefile.target
> @@ -34,6 +34,4 @@ sha512-mvx: CFLAGS=-march=z13 -mvx -O3
>  sha512-mvx: sha512.c
>  	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
>  
> -run-sha512-mvx: QEMU_OPTS+=-cpu max
> -
>  TESTS+=sha512-mvx


Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


