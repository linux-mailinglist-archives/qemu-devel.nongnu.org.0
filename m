Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB85142710C
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 20:57:32 +0200 (CEST)
Received: from localhost ([::1]:39544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYv3j-0004vF-5v
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 14:57:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYv16-0003WL-DM
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 14:54:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYv13-0006my-3l
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 14:54:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633719282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LqNcWVIpA0Ed3bQYgL3I97ApsXqINc5JtZiSOY5jEuo=;
 b=YsNkQRMjHlYKrcmzXMW3Pt8e5q33iyJv3leqZf7YVzF3EHQd4qy7n9UXmv7lsfOcNtET22
 HRjfvVFaKgCJwR0c5AK+j48zvnBhmLcDybTJOl0YChUt5tgMh7V8RPBH1hDaRaA8cbk2WE
 /iFAvvoZELUbocL3tLBCiIk9BDcdleY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-mhtAEcArO1eXl7plhbFboQ-1; Fri, 08 Oct 2021 14:54:39 -0400
X-MC-Unique: mhtAEcArO1eXl7plhbFboQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 u23-20020a50a417000000b003db23c7e5e2so10087713edb.8
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 11:54:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LqNcWVIpA0Ed3bQYgL3I97ApsXqINc5JtZiSOY5jEuo=;
 b=3axnAT8F35woHhJ3jq+Q3GzQGdnGWptyBpaAOp2rCrD3FO+rHmVgxKYZdfNr54NzGa
 Zm5d14pfSvhrBkA3TEdxWaGqdxH/wyZApXD/WYJAVFyZ4e7qwxtz/QGfCZGz3+D0tzEO
 WFT4Uc68oZrXuvQxVj8qd9rqGhA19Hjq7yZEUSpfZRsZzzZyp1PL46VGbpxipPk8u3ca
 iZH5sNTRz0Lypsqm2Iuoy54TEPmdofKlg98dGqmyIQx1wXxTCK6UELs379JNkaypaODY
 oetG851YWoCyJCRUptJRgicATunEWrgGj0pjX43gfKHlfG2ozj+rl9rahB5bJYzbqjvS
 Q9Wg==
X-Gm-Message-State: AOAM533hPQbTcLCXR64+lob3oIQYgdclSlEId1V93LWjHqo6KGAwe+gO
 eBep0Spg6XwvA8SvCO7A4dNBnX1mhPQYALzPDTyc/UrnEnzRcjhKMSDpZB9BGl9P4t+XA71zxu9
 +84FIGaSuHRvhax4=
X-Received: by 2002:a05:6402:84d:: with SMTP id
 b13mr8266094edz.6.1633719278216; 
 Fri, 08 Oct 2021 11:54:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxi8X+mAngSPnRRNHbuekuMe1CETFhJxPeIaECLBy2mRstTIh7diDP+UazMoOVKNYLyygUQuA==
X-Received: by 2002:a05:6402:84d:: with SMTP id
 b13mr8266064edz.6.1633719278007; 
 Fri, 08 Oct 2021 11:54:38 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id q11sm62450edv.80.2021.10.08.11.54.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 11:54:37 -0700 (PDT)
Message-ID: <ada1704c-b1c7-ec48-bc58-2de8d3ed466c@redhat.com>
Date: Fri, 8 Oct 2021 20:54:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] hw/misc: applesmc: use host osk as default on macs
To: Phil Dennis-Jordan <phil@philjordan.eu>,
 =?UTF-8?Q?Pedro_To=cc=82rres?= <t0rr3sp3dr0@gmail.com>
References: <4E271071-0799-4948-A445-134E7FAAD48D@gmail.com>
 <CAAibmn2wMmpRCn3GCxY0=gkAW=ZkxVB0+yMrY-w20Je++h3yiw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAAibmn2wMmpRCn3GCxY0=gkAW=ZkxVB0+yMrY-w20Je++h3yiw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.051,
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
Cc: rene@exactcode.de, jan.kiszka@siemens.com, qemu-devel@nongnu.org,
 agraf@suse.de, "Gabriel L. Somlo" <gsomlo@gmail.com>, suse@csgraf.de,
 afaerber@suse.de, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/10/21 14:03, Phil Dennis-Jordan wrote:
> 
> 1. Licensing
> Given that the code it's heavily based on is copyright Apple Computer 
> Inc., licensed under APSL, is it safe including it in qemu as is?
> If the integrated code is going to be quite so "directly inspired" (down 
> to the inconsistent struct definition style and mixing unrelated 
> constants in the same anonymous enum), perhaps at minimum place it in 
> its own isolated source file with appropriate notice?

Yeah, this should be reverted.

Pedro, I understand that you stated it was "based on code from Apple" 
but you also said (by including Signed-off-by) that

---
(a) The contribution was created in whole or in part by me and I
     have the right to submit it under the open source license
     indicated in the file; or

(b) The contribution is based upon previous work that, to the best
     of my knowledge, is covered under an appropriate open source
     license and I have the right under that license to submit that
     work with modifications, whether created in whole or in part
     by me, under the same open source license (unless I am
     permitted to submit under a different license), as indicated
     in the file; or
---

and this is not true.

Thanks very much,

Paolo


