Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD093419F5
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 11:29:55 +0100 (CET)
Received: from localhost ([::1]:55002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNCOA-0000nB-6c
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 06:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNCCY-0006MJ-N5
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:17:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNCCW-0002ma-Mx
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:17:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616149071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kRTzTgmkb2kmeDTAzCu39TmKbCrhykpcueXR9oysgbY=;
 b=fZXD1BW1TfT21er9MaY3XHuxrwNEfmWFRAz3ixRud+VqABpgOhUscFuYZiHm6z5AVZp7Fv
 ID52e4qRQg9OgDifByd98qh20l0lCpJ4MRdYB2Dccm49nPI/kCKDP4JZgkAO/7ufzrtgIF
 pbW3r2l4F+MginISBxLvrXDWEnCNA/w=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-jUlkkTFuPNaFgBtkJpYtYw-1; Fri, 19 Mar 2021 06:17:50 -0400
X-MC-Unique: jUlkkTFuPNaFgBtkJpYtYw-1
Received: by mail-ed1-f69.google.com with SMTP id a2so22552541edx.0
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 03:17:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kRTzTgmkb2kmeDTAzCu39TmKbCrhykpcueXR9oysgbY=;
 b=AiNYz37Bz0K9nG2PuDVRDVfR5evknR1aZ/GrlzHyKDvFFVtwtktGRCpn5qL+kXNDUK
 fNhHPhoB0VIrEaUkKKxFp53eXNwPaGFhRMP7Aw11zfbHUdARphAjHD+6c8qVnF4CC0C2
 LJABtLbuCh/yrlumO6+U3HOLQf1feZFqApOaqYj3AO6VGRde7bRKSKcs7lIMDLkTB06R
 7l6L/z31HfRdAHjoI0KZFnzxxksfNwOX5jC4JiRadA6PgrdLuUtjKNWQvHFqDTK0+Bi+
 eiVY+bkR8D1pEHP/xLlTHx59lQYJFHmhAOSzpPaFtPwsnj9Vk1KNrrpvwRN7C32tink/
 +PTA==
X-Gm-Message-State: AOAM531a0pAgrTUyz4CT1og38/40KoVCED/01PllqQyHOYZ6SsmPNys0
 ev/8WgUeiP3hCXFFo07BTnUefJHpFEhZDbHTAqDXU+fe+on68HgFECfZ0Aw3XlDi4ZQSx6k8eQP
 Nu0/nENpfQskXDVQ=
X-Received: by 2002:aa7:cb97:: with SMTP id r23mr8446094edt.106.1616149069106; 
 Fri, 19 Mar 2021 03:17:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwP204tTNHzuEWH0Uto6QmarLeUyP6PooDw2Xk3gOZGPU9lwqtKyh/uqLPQQxasLMw+LhWuHA==
X-Received: by 2002:aa7:cb97:: with SMTP id r23mr8446070edt.106.1616149068946; 
 Fri, 19 Mar 2021 03:17:48 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id jv19sm3421951ejc.74.2021.03.19.03.17.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 03:17:48 -0700 (PDT)
Subject: Re: [PATCH 1/2] floppy: add a regression test for CVE-2020-25741
To: Markus Armbruster <armbru@redhat.com>
References: <20200827113806.1850687-1-ppandit@redhat.com>
 <20210319050906.14875-1-alxndr@bu.edu> <87lfajsn7w.fsf@dusky.pond.sub.org>
 <5a572879-02d6-d525-627c-892bd3903c25@redhat.com>
 <87v99nmpsi.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8383637a-ad52-e4d7-a0ff-876898bf1905@redhat.com>
Date: Fri, 19 Mar 2021 11:17:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87v99nmpsi.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-block@nongnu.org, Li Qiang <liq3ea@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/03/21 10:54, Markus Armbruster wrote:
> A commit message should tell me what the patch is trying to accomplish.
> 
> This commit message's title tells me it's a test for a CVE.  Okay.  The
> body additionally gives me the reproducer.  To be useful, a reproducer
> needs to come with actual and expected result.  Yes, I can find those in
> the patch.  But I could find the reproducer there, too.  If you're nice
> enough to save me the trouble of digging through the patch for the
> reproducer (thanks), please consider saving me the trouble digging for
> the information I need to make use of it (thanks again).  That's all:)

FWIW I don't think in this case there is an expected result other than 
not crashing, but yeah it may be worth adding in the commit message "for 
CVE-2020-25741, a {crash,undefined behavior,ASAN violation} in func_name".

Paolo


