Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E275FC1FC
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 10:28:54 +0200 (CEST)
Received: from localhost ([::1]:43330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiX6j-0000O3-Kr
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 04:28:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oiX4D-0007OX-Gb
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 04:26:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oiX4A-0003Uk-UQ
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 04:26:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665563174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BdO59FtTuCD+YvU88VDh52xwvEuzuYQ5T1xSnt95NFM=;
 b=QT5l0bYx8BTP9Q7s++JH++j82tOymYCY/fLNNSXWrtegZuv19PGiHCtlum2C1hqbauGET3
 9NL88yx05gAFL/3JvnVOzteSSfRLpHvXcK7W2wl+KaldfNvaepDMVtvr/GWHiU2nv50UG5
 qTL9AP0rw25HQGOifQNfAfX8eUnthmE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-427-2L8yo5alNiGrqm3icSitZw-1; Wed, 12 Oct 2022 04:26:12 -0400
X-MC-Unique: 2L8yo5alNiGrqm3icSitZw-1
Received: by mail-wm1-f70.google.com with SMTP id
 133-20020a1c028b000000b003c5e6b44ebaso778154wmc.9
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 01:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BdO59FtTuCD+YvU88VDh52xwvEuzuYQ5T1xSnt95NFM=;
 b=ttzpgCkeqWcq5kfc5zJutkXwLhujsL9vXtdFx1GE2U4MHOzQfUjeks/0kLZwgZMLoO
 nUOieqmnRisqTN3BZUr7PySDzknCn+08hyc1D/qUmX5m3Ce9SylJVsPaBPagFrRj3lMG
 GXWJsCudq6UE45yXterJYRu//FIHPdxSwHI+X3buuxPdmbUZ8gZi/mYlJ9XHvocEpaPS
 W7+BkQYGLBF1wtpL1j71avGnFWES+2eADT7ZzszwQ4cn7uLYCGzYvVWs6RG13phfqmfo
 lFzymC8UKU2sciXsCGba3q7WHh28gHuk+C4Uy/a/Nv0hnaSFVv07fhE+n6b5sLuirquo
 wuAw==
X-Gm-Message-State: ACrzQf2gmGFo0biB6TjrxiwwiDTMdGG/NfDmW9FKav5K9GYgUib8wm3T
 r6R9aP4GtYfB+lb0GK2umWrOR81c9UjKQ2MQpU3zfZwfFP3U7vj/fxA/MJA91p7zXF/4eJ31hd1
 cRKKhqxdxBSQK5vQ=
X-Received: by 2002:a05:600c:2754:b0:3c6:aba7:5c93 with SMTP id
 20-20020a05600c275400b003c6aba75c93mr1831423wmw.177.1665563171444; 
 Wed, 12 Oct 2022 01:26:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4+itBEH0NVlyeujfZXabBxYhT49ag0xemzz2CtbT36upQ6R+hUglPzHR+lMWJvrkGVRcmshw==
X-Received: by 2002:a05:600c:2754:b0:3c6:aba7:5c93 with SMTP id
 20-20020a05600c275400b003c6aba75c93mr1831403wmw.177.1665563171188; 
 Wed, 12 Oct 2022 01:26:11 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:3a00:4f2c:105b:3371:a623?
 (p200300cbc7043a004f2c105b3371a623.dip0.t-ipconnect.de.
 [2003:cb:c704:3a00:4f2c:105b:3371:a623])
 by smtp.gmail.com with ESMTPSA id
 g13-20020adfe40d000000b0022e3d7c9887sm12767425wrm.101.2022.10.12.01.26.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Oct 2022 01:26:10 -0700 (PDT)
Message-ID: <e2f96ef7-fc2d-ce25-34f8-ebb1619a03d6@redhat.com>
Date: Wed, 12 Oct 2022 10:26:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 4/7] util: Add write-only "node-affinity" property for
 ThreadContext
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Michal Privoznik <mprivozn@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
References: <20221010091117.88603-1-david@redhat.com>
 <20221010091117.88603-5-david@redhat.com> <8735buj3rd.fsf@pond.sub.org>
 <f147185e-0cf4-2ba5-0adb-a07e56fd7c63@redhat.com>
 <87zge1eaf8.fsf@pond.sub.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <87zge1eaf8.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.934, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12.10.22 10:03, Markus Armbruster wrote:
> Acked-by: Markus Armbruster<armbru@redhat.com>

Thanks, I'll similarly adjust to use "host nodes" and "host CPUs".

-- 
Thanks,

David / dhildenb


