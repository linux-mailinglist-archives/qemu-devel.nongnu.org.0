Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4F439D4BC
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 08:15:06 +0200 (CEST)
Received: from localhost ([::1]:32778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq8XR-0000RP-5G
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 02:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lq8WU-0008Dd-Ao
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 02:14:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lq8WR-0006Rj-4Q
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 02:14:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623046441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nFbEFbaM5w8re7QZ5Yf4T8ZU8uMekIsgMOaeC6ozRHY=;
 b=f62iBNEqiDt62Oov+8LlQRmlZXsr+leqVvydQIYuaAaxRH07+IMdksx65bqZiAnXdeOfhs
 2tqGg7iP6CbHBIC8m0vuKWgRVa4x7GflEel/iKQDsvK7u4XNsyi1WZxDSmfV9JyfLFoeAm
 W3cXF3gY8AED09Jev+l9e5E6cNgxZjE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-yYtNITxjMZqx2rKVAj0veA-1; Mon, 07 Jun 2021 02:13:55 -0400
X-MC-Unique: yYtNITxjMZqx2rKVAj0veA-1
Received: by mail-wr1-f69.google.com with SMTP id
 n2-20020adfb7420000b029010e47b59f31so7341998wre.9
 for <qemu-devel@nongnu.org>; Sun, 06 Jun 2021 23:13:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nFbEFbaM5w8re7QZ5Yf4T8ZU8uMekIsgMOaeC6ozRHY=;
 b=iW71rI1SV9SqdT6vglmLdEE2cu7nEmP77x67WptueQoiC2qilkxAX1opguIOg2tl+l
 wM3O2ghnGLQBM6P/u6UJBOv9/mtSG69jqmW39LhfFihED+C5eXJxw84v7bvybxJLqY6a
 e7HIf5hyNCHBaIuzSbNdPyFoEit0KrbeI8Ig37S9H3LWwtz/qlCUqfUdSSuJwSzY/H5t
 KXuXUdABDuPKdyqnTNfHnvvWIlBh60KHz46FDshWHXitpGtNTA/g5Hf0/iCivli8uOLd
 Wnv8nCrLFWxTalova+BfaH+H0Zxc92vPwGuZ/R7/lduvA4kD89yWwKnGlzqOrRfiWSuO
 Wiew==
X-Gm-Message-State: AOAM533cUDuR3vZJU6SZH1xZxrW/e9ZiKNQ7GnzdBlOfdbt453LnXPbX
 3OxlnGxjJDiE15+CXtoVbLENDxbizv1PVM+SzIlk9ChNuWDEM5DVYScJUeuFksGEXWw6ydM8vdy
 rrWUqk9ese3/dOsJHOnNUVBCC3X/Xqjt3WusiXxOxKWcjxzFrnjBCjmtftB8U/+A=
X-Received: by 2002:a7b:ce8a:: with SMTP id q10mr15334854wmj.184.1623046434640; 
 Sun, 06 Jun 2021 23:13:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytGm5hLZxT2lY+HZYISVQwrNpwPLyrSl1mRDFm+2f2sjzULOP4zIbhZibooCbF1ptCfZP+KA==
X-Received: by 2002:a7b:ce8a:: with SMTP id q10mr15334838wmj.184.1623046434466; 
 Sun, 06 Jun 2021 23:13:54 -0700 (PDT)
Received: from thuth.remote.csb (pd957536e.dip0.t-ipconnect.de.
 [217.87.83.110])
 by smtp.gmail.com with ESMTPSA id w8sm15642939wre.70.2021.06.06.23.13.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jun 2021 23:13:54 -0700 (PDT)
To: Kallol Biswas <kallolkernel@gmail.com>, qemu-devel@nongnu.org
References: <CANcxk1j5qrz5zOqXMdYCb9U17jar8OMWybyFUEaRyK7SPwe8Og@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: debug script for QEMU/KVM
Message-ID: <63ed0d8f-eeef-f082-987f-fe9d36e97d37@redhat.com>
Date: Mon, 7 Jun 2021 08:13:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CANcxk1j5qrz5zOqXMdYCb9U17jar8OMWybyFUEaRyK7SPwe8Og@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/06/2021 00.52, Kallol Biswas wrote:
> 
> How can I find Qiang Li's blog and other qemu-developers' blogs?

  Hi,

I don't know about about Qiang Li's blog, but most QEMU developers' blogs 
are aggregated here:

  https://planet.virt-tools.org/

You can find the links to the individual blogs on the right hand side of 
that page.

  HTH,
   Thomas


