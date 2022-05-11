Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C69522FBF
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 11:45:31 +0200 (CEST)
Received: from localhost ([::1]:51148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noiuQ-00054v-9A
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 05:45:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1noihT-00008W-Eu
 for qemu-devel@nongnu.org; Wed, 11 May 2022 05:32:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1noihR-0000uq-1V
 for qemu-devel@nongnu.org; Wed, 11 May 2022 05:32:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652261488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FLPrlkXBx3Rcs8lTigksIOFH6N6mAEO6R2+M8gkzCR0=;
 b=g489Ithp443HgtYgMq24gMx8jILdSPGJkO//bEI9fgH+FbS7tiXwK+STkccjq0f2tPGuR0
 W4LR9Su97MKm7xxycFmflITmO4i5M4o44FDB488kWOlBJoJjSsDzwnDOSPTTHRHLN6cIn+
 vx5PNEl7DS9Jyp2tmvUSE2AmqytRcho=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-aFO8EgVVPOqLO8-jlntxwg-1; Wed, 11 May 2022 05:31:26 -0400
X-MC-Unique: aFO8EgVVPOqLO8-jlntxwg-1
Received: by mail-wr1-f71.google.com with SMTP id
 ba21-20020a0560001c1500b0020ca6a45dfcso615427wrb.9
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 02:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FLPrlkXBx3Rcs8lTigksIOFH6N6mAEO6R2+M8gkzCR0=;
 b=lNH6ai65vC9jwJpRXvoQgSRDlXkMyVfyVO6wEimxcDSmGpHGniQy1yD+vo5Dcu112H
 me8sN9iXQHwTFFcK6FDyK/dg9wK4n4hOHv5vNIEUcSBE5fCoSUZ/XRxTpluXnElHPRSd
 vvPDhf8CioQdlfPaAx1qoDixvTNvr1t+y9ldBssmKQDlEPkA+irbnJAaaj5GqKKayn7B
 JCMsx24AcL894h8ytq/YgvZzLSPFmChHhNIIoUwdNMpPDDt/QFXIlcCaRUxcRyEYKFwX
 uZZ3sJxDeraciWapS1NX/m6Fy3YmREsrxa1QbHaasXYJYmM+kspPrKp4w8wyn3zf7Yjr
 ntvQ==
X-Gm-Message-State: AOAM530X2f8sx5Mncfq3iKhIw9kdAYANkAED5qOqvTmUl30mwGYWpE7T
 B9eoPBdfBvAtm4sAVPVGiH585lM3xvkBeaLT/GVVs5i2rsxYlFk0VUqw6+u0Bnb/kscN7AkTZVQ
 lu9opw316VIChX0Q=
X-Received: by 2002:adf:d1e9:0:b0:20c:6c76:14d5 with SMTP id
 g9-20020adfd1e9000000b0020c6c7614d5mr22435149wrd.375.1652261485203; 
 Wed, 11 May 2022 02:31:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwt1VIISj0jAfZLR0OMlo5Za4O8cQjMIJobnii9Cp5FsalL4JAFzEytiAA2c1eSXi0bWfi90w==
X-Received: by 2002:adf:d1e9:0:b0:20c:6c76:14d5 with SMTP id
 g9-20020adfd1e9000000b0020c6c7614d5mr22435133wrd.375.1652261484976; 
 Wed, 11 May 2022 02:31:24 -0700 (PDT)
Received: from ?IPV6:2003:cb:c701:700:2393:b0f4:ef08:bd51?
 (p200300cbc70107002393b0f4ef08bd51.dip0.t-ipconnect.de.
 [2003:cb:c701:700:2393:b0f4:ef08:bd51])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a5d6542000000b0020c5253d910sm1138595wrv.92.2022.05.11.02.31.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 02:31:24 -0700 (PDT)
Message-ID: <8a6b84ed-50bc-8f6e-4b71-7e15247c4ac0@redhat.com>
Date: Wed, 11 May 2022 11:31:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] util: NUMA aware memory preallocation
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Cc: qemu-devel@nongnu.org
References: <ffdcd118d59b379ede2b64745144165a40f6a813.1652165704.git.mprivozn@redhat.com>
 <Ynt/v2SHmnO2afg4@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <Ynt/v2SHmnO2afg4@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>> Long story short, management application has no way of learning
>> TIDs of allocator threads so it can't make them run NUMA aware.
> 
> This feels like the key issue. The preallocation threads are
> invisible to libvirt, regardless of whether we're doing coldplug
> or hotplug of memory-backends. Indeed the threads are invisible
> to all of QEMU, except the memory backend code.
> 
> Conceptually we need 1 or more explicit worker threads, that we
> can assign CPU affinity to, and then QEMU can place jobs on them.
> I/O threads serve this role, but limited to blockdev work. We
> need a generalization of I/O threads, for arbitrary jobs that
> QEMU might want to farm out to specific numa nodes.

At least the "-object iothread" thingy can already be used for actions
outside of blockdev. virtio-balloon uses one for free page hinting.

-- 
Thanks,

David / dhildenb


