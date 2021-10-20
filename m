Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6E8434602
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 09:41:20 +0200 (CEST)
Received: from localhost ([::1]:39404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md6Dv-0007lH-OV
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 03:41:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1md6Cg-0006pW-Us
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 03:40:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1md6Cf-0006I6-7q
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 03:40:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634715600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G47Bi3DSc4726lf1ZMoLcFL2RU+/czDtcrH20sPXODc=;
 b=APV9KcyI0/EwPU2iA5lnehVP5IVORSe1o0DMozYBC4CO3AmHYWId3g2lVv0wFnM9z1D9yY
 Y8YjVguGzxGB3baw/ZTTSo1NIWMuxO45n5iiiGRroeZwU1jgh39uX14ANVJAqwL2GrPgRc
 ZFR5jlvgSOJW+N9c+SUone2NcwyO7UM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-8IMd_2MDNxuZF-88xLJMOA-1; Wed, 20 Oct 2021 03:39:59 -0400
X-MC-Unique: 8IMd_2MDNxuZF-88xLJMOA-1
Received: by mail-ed1-f70.google.com with SMTP id
 c25-20020a056402143900b003dc19782ea8so16661278edx.3
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 00:39:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G47Bi3DSc4726lf1ZMoLcFL2RU+/czDtcrH20sPXODc=;
 b=vYFiA9U7aiNREeQOYvk9tqReX8WUEk2hBKHVHWudYaWN6yowsKR8a2JN3lSZIAMP9d
 0E0uWJ0hIYFOKD1c9QxS8/OioksRQPg2sSkuEIUXYyCHE/grnDLcfvpTN6EJ+EhcV0HT
 22u7PNltRyYg8J1za8xiIxGcPeSolcmXgE1Xbqw5xK6mv6GVP+HwNEpAmeBwmNaskxqR
 qcIvrjnbeAHLR+95uNhFrH/h6ucuky2Lq+Fl63DC1iiMIC9FYnfqXpX1D1Irnfk39IOp
 BcirGkVk9f+YQGZq1rT6UMCPz9aQi45VyGo9aBCPrGXZ092A94TpLqI3uh9lI+aX6g1Y
 RGbQ==
X-Gm-Message-State: AOAM531Qy8YPKnyEChI2QiHJX5g6ydUy54MlIxoDWnuUNbOzaAYS5iPs
 Yh3rJQkhIRUHs4IY+9B8ED00drxLImczuIzJ9ZXSptKw0+xajFQq2GfnFl8qprYxACuFQ/y5WlO
 dyuWtmy0NfWuuJyE=
X-Received: by 2002:a17:906:ecf6:: with SMTP id
 qt22mr43966250ejb.292.1634715597884; 
 Wed, 20 Oct 2021 00:39:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyc9luR7FrO1wW0hPEWeyMQhMpgSHwsbeX/DXHTPHw17dHO5R3hkNWcnVRpgk1qjmY28xSGZQ==
X-Received: by 2002:a17:906:ecf6:: with SMTP id
 qt22mr43966233ejb.292.1634715597660; 
 Wed, 20 Oct 2021 00:39:57 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id h7sm691139edt.37.2021.10.20.00.39.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 00:39:57 -0700 (PDT)
Message-ID: <a39d1361-7153-6d6f-7e97-f179eb7ad233@redhat.com>
Date: Wed, 20 Oct 2021 09:39:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/2] qmp: Support fd-based KVM stats query
To: Mark Kanda <mark.kanda@oracle.com>, qemu-devel@nongnu.org
References: <20211019202904.4857-1-mark.kanda@oracle.com>
 <20211019202904.4857-2-mark.kanda@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211019202904.4857-2-mark.kanda@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.074, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 19/10/21 22:29, Mark Kanda wrote:
> +#
> +# @filter: KVM stat name (optional)

Nitpicking on the name, "filter" makes me think that some kind of 
globbing is supported.  So I would just call it "name".

Also nitpicking on the name, let's drop "kvm" from everything.  In the 
future other subsystems could expose statistics, both in the kernel and 
in QEMU (e.g. vhost or TAP; even query-blockstats could be integrated).

Finally, I think we should decouple the description of the stats and the 
description of the sources of said stats.  For example:

    name			type
    ----			----
    vm			kvm-vm
    vcpu_0		kvm-vcpu
    ...

This way the caller knows that the "vcpu_*" stats follow the same 
schema. That would be:

# e.g. name: 'vm', 'type: 'kvm-vm'
# or name: 'vcpu_0', 'type: 'kvm-vcpu'
{ 'struct': 'StatsInstance',
   'data': {'name': 'str', 'type': 'str'}}

{ 'struct': 'StatsSchema',
   'data': {'type': 'str', 'stats': [ 'KvmStatSchema' ] } }

{ 'struct': 'StatsValues',
   'data': {'name': 'str', type': 'str', 'values': [ 'int64' ] } }

{ 'command': 'query-stats-instances',
   'returns': [ 'StatsInstances' ] }

{ 'command': 'query-stats-schemas',
   'data': { '*type': 'str' },
   'returns': [ 'StatsSchema' ] }

{ 'command': 'query-stats',
   'data': { '*name': 'str', '*type': 'str' },
   'returns': [ 'StatsValues' ] }

This should be enough to make the API more future proof.

Paolo


