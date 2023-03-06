Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A6D6AC179
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:38:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZAzc-0002LF-2X; Mon, 06 Mar 2023 08:35:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZAzF-0001wv-88
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:34:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZAz4-0008Ag-9O
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:34:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678109673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rdQER8W776n/qRq34usvPAeBU3ts30dnHQ8irJJDQp8=;
 b=WGq9B9VB5XBo2ojbehFzYiZxmKkUKPk+Ovq52BJRBnOys7MP8MyT4ijCH1HcJ+ycb/eSoG
 m3GFrcCz6AyQKh6phC26f4lq0GdkyjwQ+IqE9vNra+TRNAZMc4zmC9P03Q6BxxTmGpgcQG
 33pdsQTVx6056Xcb9dLYzXwzXxfN8/A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-zul6GOWIMW23uJJEV999ow-1; Mon, 06 Mar 2023 08:34:24 -0500
X-MC-Unique: zul6GOWIMW23uJJEV999ow-1
Received: by mail-wm1-f71.google.com with SMTP id
 l31-20020a05600c1d1f00b003e8626cdd42so3581663wms.3
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 05:34:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678109663;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rdQER8W776n/qRq34usvPAeBU3ts30dnHQ8irJJDQp8=;
 b=6kZK0o+yVd04FhF4cncAtD++l5Ep/eTaMO8lRvvEO/bxrpSSKb6OT2Yzurn8d6BZsc
 5HjXCI6rWZijkKQTvN/qFHx+fDJd7sJIdrGSG1rsTal7BLY1Ch3Bj25Z6NL5LDHgFGG4
 UI8iefi9nrpyHiw6houy//QabPEIQ7khLPu6OOYKAp1C+fjMoUNlsavS6MBpTya54Xa+
 fzNJ2fD5EB2PVO2RFRKPcO07+fA2aJI/CiMTYtsdiGZiyFGlTCg7cWpqPdBuDR9l9l6y
 rFksVXNmVJuL358FihJO7S6JSzsYJpBO/PW5E8RJlAYieQgvCfiMU+73r39uH33Ok1T2
 3lAQ==
X-Gm-Message-State: AO0yUKUnJZKtvbsyqnwsgs5erK0JS582po2ASVCqbp+5nOR3sEyyBRmJ
 /XJAsprrx69n4d/iE4P1WaRvmL3coN4r+OpHhdIU53XLCTHhwuPdJtEVaTf3Xj7pkPpzdaZUoC/
 KKVJcBW29iVo/UvM=
X-Received: by 2002:a05:600c:5008:b0:3df:e41f:8396 with SMTP id
 n8-20020a05600c500800b003dfe41f8396mr9040949wmr.37.1678109663207; 
 Mon, 06 Mar 2023 05:34:23 -0800 (PST)
X-Google-Smtp-Source: AK7set9OX9h0H0SjDfjil6kA2aqgq9syoKuThWwlu9Z4I3RhrROurVxev1Rl5xqzM5iXO5WeP4XOdA==
X-Received: by 2002:a05:600c:5008:b0:3df:e41f:8396 with SMTP id
 n8-20020a05600c500800b003dfe41f8396mr9040931wmr.37.1678109662869; 
 Mon, 06 Mar 2023 05:34:22 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:3500:b8a3:191c:eae:cc05?
 (p200300cbc7043500b8a3191c0eaecc05.dip0.t-ipconnect.de.
 [2003:cb:c704:3500:b8a3:191c:eae:cc05])
 by smtp.gmail.com with ESMTPSA id
 m19-20020a05600c161300b003eb5a0873e0sm10222519wmn.39.2023.03.06.05.34.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 05:34:22 -0800 (PST)
Message-ID: <806aec75-97a1-178c-cb4e-a0e322635aca@redhat.com>
Date: Mon, 6 Mar 2023 14:34:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 8/8] physmem: add missing memory barrier
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, stefanha@redhat.com,
 cohuck@redhat.com, eauger@redhat.com
References: <20230303171939.237819-1-pbonzini@redhat.com>
 <20230303171939.237819-9-pbonzini@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230303171939.237819-9-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 03.03.23 18:19, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


