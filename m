Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA74406D75
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 16:17:37 +0200 (CEST)
Received: from localhost ([::1]:34566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOhLT-0003of-Q5
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 10:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mOhJo-0002Ki-Hz
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 10:15:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mOhJj-0005xv-O2
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 10:15:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631283342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5BZ4OZIwxmREUpzX215sYv3Rzm73dWM0j9+tjZ2JMwE=;
 b=a2rbatbbJVRNQZnwqOnBwM4uiQgBjJvf1PW+oYdfB/4rdILuwrAi5o0XT8N2Nx+2eHBE78
 JM1kMTjbJftAtzQcg0mRpohHKyr828zbTHutc2dRmmEnGCQWEmKxlqYieASsiMLbtViVSS
 0ytmepC2mx05bCNd4Kn/WTdJrw9Ta3Y=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-RtJQzU0OOZKWSOywEiulOA-1; Fri, 10 Sep 2021 10:15:34 -0400
X-MC-Unique: RtJQzU0OOZKWSOywEiulOA-1
Received: by mail-ed1-f70.google.com with SMTP id
 y19-20020a056402441300b003cd8ce2b987so1019428eda.6
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 07:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5BZ4OZIwxmREUpzX215sYv3Rzm73dWM0j9+tjZ2JMwE=;
 b=Gl+t2YOtpw52Yoo90eIkDIpquf1TzB3T0DARWFNXC543R0T03ZnWF0G7XMitkEg4CP
 rzrSiqaLgrb+7RRC78YflVnyycN0159ETP7Qq4x5+3QAJSGYwgqo6B0VA3VPYTP8lgX8
 S/mq9wmqn8ZYJazAu71a9MFcG50zjoRHg4mgr4bm0r3O6/o9Gtf7dwNw1/lSuqpf9LE6
 HAH88lVusWnbWDf+FJye5eiyo8yeBHVVUWIIpgP9JLnKklEZk7rcOdxh2JTOKYvbexYc
 l6BXGvrFdqBkh0UnFsl6iYSaDT7bDTIpKr5zig0d9db+EzLp52xo5ecc1hvGzadyUW86
 2qIQ==
X-Gm-Message-State: AOAM530gwE1KDExsHJcAmahHh2AE7JkSBv0lNFeKmsm/OyyNlSIQbihu
 imj3Hjoo4NIF61Oma3gyKuu3jItNqOKFl/42UMQnHkOz0l1w31ETKhARBXqqhnrbNcekidzGAhN
 D9xoLulb3BSp6e5M=
X-Received: by 2002:a05:6402:51d0:: with SMTP id
 r16mr9243897edd.98.1631283323233; 
 Fri, 10 Sep 2021 07:15:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdeaPKDlZFUObnr6ghtESy73qVsubv5EQzxhrekdc1EUQ/DcCP6wLM1uU/yzVqA1lsmIBgNA==
X-Received: by 2002:a05:6402:51d0:: with SMTP id
 r16mr9243877edd.98.1631283323021; 
 Fri, 10 Sep 2021 07:15:23 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id lb12sm2562129ejc.28.2021.09.10.07.15.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 07:15:22 -0700 (PDT)
Subject: Re: [PATCH v2 0/3] The HMP/QMP interfaces in Qemu SGX
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20210910102258.46648-1-yang.zhong@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <91c0fa12-1191-ddae-efb4-35dc1eb61d39@redhat.com>
Date: Fri, 10 Sep 2021 16:15:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210910102258.46648-1-yang.zhong@intel.com>
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
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.349, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: eblake@redhat.com, philmd@redhat.com, seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/09/21 12:22, Yang Zhong wrote:
> This patchset supply HMP/QMP interfaces to monitor and Libvirt, with
> those interfaces, we can check the SGX info from VM side or check
> host SGX capabilities from Libvirt side.
> 
> This patchset is splitted from below link(from patch26 to patch30):
> https://patchew.org/QEMU/20210719112136.57018-1-yang.zhong@intel.com/
> 
> The rest patches are being pulled by Paolo's below link and this new
> patchset is based on it.
> https://gitlab.com/bonzini/qemu.git tags/for-upstream

Queued 1-2, thanks.

For patch 3, I would like to learn more about the whole reset part of 
the series.  Would it be possible to handle it in the kernel without 
having to reopen the vEPC device (there's a possible race where you 
can't reopen and it's a huge mess)?

Paolo


