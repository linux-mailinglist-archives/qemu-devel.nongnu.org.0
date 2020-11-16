Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE07B2B4409
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:53:16 +0100 (CET)
Received: from localhost ([::1]:53804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kee0R-0001J5-OZ
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:53:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kedz5-0008Rk-NP
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:51:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kedz0-0004Lk-H6
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:51:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605531105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ggrFBsbLftxCVNh/VJ09LR9peWJ4I9crEfEBtd0Jt1o=;
 b=UWqz/AnHWjG+vl0Qx38Y8SjKQLGkbxdhW+nwqZGLNV6mC5iLIugL3sxN/3Q2+ygCji4qfV
 QZ9AUCGxg1TRkD/tZpIxXW8abfg/L1Ufis89R79yiaMtwIUjjN9c/l304hLuNsg6S4+dML
 aMNYGj73Dr5jKB4tFOmH+wCXaQWSCXY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-S-88QuH-PkWNfacJ108J6Q-1; Mon, 16 Nov 2020 07:51:40 -0500
X-MC-Unique: S-88QuH-PkWNfacJ108J6Q-1
Received: by mail-wm1-f71.google.com with SMTP id y26so8704845wmj.7
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 04:51:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ggrFBsbLftxCVNh/VJ09LR9peWJ4I9crEfEBtd0Jt1o=;
 b=EeEsHlmfVTNZLf5wizp2BuC0UnEA+kmxuoy5H79AN5nvi13MIPug+JpIMb7ncPAG/g
 Og91vM/3SgMHGFJ8b73nJzMnBAl0FKt6pCAaDiO4j25lIFMUs2ERf9AxIfmYjgh73xxw
 9/Rcu0MlrsC18Wsydm/kT+JJxWOYHgzVjUyyOblgcnhENHwmndzSZo0+fdxJ8K+NBS2A
 MXgOApxBcY7nYxrfqw+MRm/iuVju/LmjNcQLb6u0lb/5Ztnb7SLv40fxvSH9LSjzb+ie
 rKW++cqEECeJJY61+u+cpVIOL7F3UyeK4UFdMwRs25asv12/qNudNpU4f6BxA/5iy8uA
 eVcA==
X-Gm-Message-State: AOAM533elcXZBkNEn6ZZXpAJOITOHq8TgjK4epsL3A3xNft18Eu0Vujf
 3n7ZbrKkMfjKZOrSH7RUrOBdyjHoYwdWknr2DFNIul9k0QR3OJKHogkDlNFmQ3W/YPpujC+qIpU
 H2/+2gC7IC95xfuNwHDebq/TPYU7jH4ofHklftZmepwvnvCX0QjVYIlhpkijbQMwf
X-Received: by 2002:adf:c50e:: with SMTP id q14mr18281384wrf.270.1605531098835; 
 Mon, 16 Nov 2020 04:51:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXkP9TuqvTxlBICR/kbfKq5ATYoRfcMCQz9vaeURlXNZJbF9qMDHH2imG8R9JOALAAOpCozQ==
X-Received: by 2002:adf:c50e:: with SMTP id q14mr18281358wrf.270.1605531098592; 
 Mon, 16 Nov 2020 04:51:38 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id v189sm21134336wmg.14.2020.11.16.04.51.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 04:51:37 -0800 (PST)
Subject: Re: Property '.hmat' not found
To: Jack <s108062518@m108.nthu.edu.tw>, qemu-discuss@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <69ce94c221fc90c6963c3529ddc46e66@m108.nthu.edu.tw>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1547b1c8-36e2-179e-8406-4faf0324f4f2@redhat.com>
Date: Mon, 16 Nov 2020 13:51:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <69ce94c221fc90c6963c3529ddc46e66@m108.nthu.edu.tw>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Igor & Eduardo.

On 11/13/20 10:17 AM, Jack wrote:
> Hi all,
> 
> As I follow the document[1] to enable hmat, it fails and shows the message:
>   qemu-system-x86_64: Property '.hmat' not found
> 
> My QEMU version is 5.1.90
> 
> Does anyone know why?
> 
> Here is my command:
> 
> ```
> $ sudo qemu-system-x86_64 \
> -machine hmat=on \
> -m 2G \
> -object memory-backend-ram,size=1G,id=m0 \
> -object memory-backend-ram,size=1G,id=m1 \
> -smp 2 \
> -numa node,nodeid=0,memdev=m0 \
> -numa node,nodeid=1,memdev=m1,initiator=0 \
> -numa cpu,node-id=0,socket-id=0 \
> -numa cpu,node-id=0,socket-id=1 \
> -numa
> hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-latency,latency=5
> \
> -numa
> hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=200M
> \
> -numa
> hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-latency,latency=10
> \
> -numa
> hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=100M
> \
> -numa
> hmat-cache,node-id=0,size=10K,level=1,associativity=direct,policy=write-back,line=8
> \
> -numa
> hmat-cache,node-id=1,size=10K,level=1,associativity=direct,policy=write-back,line=8
> \
> -cpu host \
> -m 4g -vga virtio -hda ubuntu20.04.qcow2 \
> -nic user,model=virtio \
> -nic tap,model=e1000 \
> -nic tap,model=e1000 \
> -accel kvm
> ```
> 
> Thanks.
> 
> [1]
> https://www.qemu.org/docs/master/system/qemu-manpage.html?highlight=numa
> 
> 
> Sincerely,
> Jack
> 


