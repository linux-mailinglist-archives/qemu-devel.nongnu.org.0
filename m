Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEE73EED45
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 15:23:14 +0200 (CEST)
Received: from localhost ([::1]:54260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFz3h-0006KU-6d
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 09:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mFz2U-0004x4-8h
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 09:21:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mFz2R-0002HX-Pi
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 09:21:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629206515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LGLwH17VUm3lQpEE2czLh5q2eH6v9mff1iGjkeZWAnQ=;
 b=foAFNo+SuyJ6M76gu0+IdyDWcrtr3Pcecx/ZmscC/uJ02hszwv1+lvtgHVLsPQJNNRg4no
 7kgoOnp0cGornRj4ne5o8fpNbdQw9goAxirayaqPOM3FgjXtrhRKwGELUFZOXRlZ20sN0i
 HCvSpHmNKJ0OGdCpyf8wS9Sm4/LcYHQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-MVriN4LiNOK0YBZ6-5W4xw-1; Tue, 17 Aug 2021 09:21:53 -0400
X-MC-Unique: MVriN4LiNOK0YBZ6-5W4xw-1
Received: by mail-ed1-f70.google.com with SMTP id
 p2-20020a50c9420000b02903a12bbba1ebso10534237edh.6
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 06:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LGLwH17VUm3lQpEE2czLh5q2eH6v9mff1iGjkeZWAnQ=;
 b=s6KQZAnZxKdGlOltsqXF7C5c6LVQDr2ov3c9yJ6jvCu4++w+YpJW+Zv3SZn85C9fdr
 oTBHAZBk+1GK2v5uX29VifutVI0gpMMwTG3TWl8+y0jhFMUjIXmttb5o/ySWYx4nIeNI
 eWmCLvtTu5Wt2VEBCyUy+wBF9UODaTcwb7z2+ecUymBUNRRTGw8sIVX3+HNHLoJ6OXcw
 eyNykHf9M7k1VJmSwMQ14nxddFX2gh5gW9l9e73xi0ITh/kUREUwhulBaVoi+qC+w87J
 +DWk7TsY4jJNRVmwi1vnBl/9gUtEj59V92XnJ6n11qwX0bZOSNaBIq13B6lavEoio6oM
 SL/A==
X-Gm-Message-State: AOAM53300QKMHTg+slhsW5dg7/cdUgACPefWb7XZwBLzTjgrvD2HGwly
 sfEATAqLA/1S1FJx7UVFyA+7nrCYmykCC7YYsxV6ISdztS7nCMTSRYahxDqIWwSvNevenZd8/KX
 8NDAI4WUmVIeOwUs=
X-Received: by 2002:a17:906:a195:: with SMTP id
 s21mr3960600ejy.181.1629206512652; 
 Tue, 17 Aug 2021 06:21:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyM+mxzNZPKNNik4FYNDvhOP9+PbsoxiwMox4QuWeDEEjKEEHC5wFazemHwGCj0XXmkTQk8hg==
X-Received: by 2002:a17:906:a195:: with SMTP id
 s21mr3960574ejy.181.1629206512451; 
 Tue, 17 Aug 2021 06:21:52 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ck17sm1064207edb.88.2021.08.17.06.21.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 06:21:51 -0700 (PDT)
Subject: Re: [PATCH] qapi/machine.json: Remove zero value reference from
 SMPConfiguration documentation
To: Andrew Jones <drjones@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
References: <20210817125356.9461-1-drjones@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <499ab471-f10f-a734-09e6-a38b1b71863e@redhat.com>
Date: Tue, 17 Aug 2021 15:21:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817125356.9461-1-drjones@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/08/21 14:53, Andrew Jones wrote:
> Commit 1e63fe685804 ("machine: pass QAPI struct to mc->smp_parse")
> introduced documentation stating that a zero input value for an SMP
> parameter indicates that its value should be automatically configured.
> This is indeed how things work today, but we'd like to change that.
> Avoid documenting behaviors we want to leave undefined for the time
> being, giving us freedom to change it later.
> 
> Fixes: 1e63fe685804 ("machine: pass QAPI struct to mc->smp_parse")
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>   qapi/machine.json | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qapi/machine.json b/qapi/machine.json
> index c3210ee1fb24..157712f00614 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1288,7 +1288,7 @@
>   ##
>   # @SMPConfiguration:
>   #
> -# Schema for CPU topology configuration.  "0" or a missing value lets
> +# Schema for CPU topology configuration.  A missing value lets
>   # QEMU figure out a suitable value based on the ones that are provided.
>   #
>   # @cpus: number of virtual CPUs in the virtual machine
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>


