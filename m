Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7660C63D273
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 10:50:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0Jiw-000848-Pf; Wed, 30 Nov 2022 04:49:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p0JiF-0007zD-Tv
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 04:49:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p0JiD-0003Uo-Fw
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 04:49:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669801743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wUpAv/1VLXs/47fIWeFfhxQrGwc6YlG6Ms6GVAD82SI=;
 b=Ts8r5ltvtlYGpxGgop3pFs1w+5QY+6VRDPXZ68cn21sBr7rBgy30buDRic6lWOkL2PgUYX
 4gq/reiyifxbbdcYcCnlfIJZtV+P9poNxBNtKdS69ftrnzVeedjoFDArIvmyGiCVNraEaW
 vXAlI/FwbGb6nfLINl+x46g1XWdRLRY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-625-IFnhDoZqPGO-vRzyiDSQUg-1; Wed, 30 Nov 2022 04:49:02 -0500
X-MC-Unique: IFnhDoZqPGO-vRzyiDSQUg-1
Received: by mail-wm1-f72.google.com with SMTP id
 8-20020a05600c228800b003d0376e42deso443097wmf.4
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 01:49:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wUpAv/1VLXs/47fIWeFfhxQrGwc6YlG6Ms6GVAD82SI=;
 b=FM81qmd1WwVkOXtKQWOryy9HpD3+0Fvo9p4JXZy/q5o2w0bTtWwl/MJ6Z2tdO6ykYl
 f3YPwvkKuNbTnM2TYfboPfkMvR05BhlQcv9YiG+qhxRQVezoqxiaiNusvLVg5NgTboBe
 UdkYEu/uRCK97fPrLJ2Ja5fyc9i7wTuQTW5+IbrSl+440SRVLaINoZVEI3Rw7zYpKR/X
 trjSlN6ZB5+2o1sVuj3UsCXSv15kvEoZ3rXAfptWkz59OorlZnSnDTWvPC00xmhUtCfO
 AtNNH6dNp453x79uvgeaB0gfj388sUgmToTEy9bsU1VgHFbx2vJO8g3UxJxzZGEIC9Tk
 v8jQ==
X-Gm-Message-State: ANoB5pkOYyaDebAfUUeYbgFgcj1FIgunwYcOeV8Isq4WU/bPEXhLKpjY
 /CgxDp2vIXkAFwTti+rHkgZiZ6znMIhVzmHtheFXCex0idIoeClAq+o2EUDtfllX45ZW5WyZKM1
 of2j2zLDrqo1/23k=
X-Received: by 2002:a1c:6a0a:0:b0:3cf:d64e:1cea with SMTP id
 f10-20020a1c6a0a000000b003cfd64e1ceamr30318184wmc.183.1669801741056; 
 Wed, 30 Nov 2022 01:49:01 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7innkeT+irREzFyd6B4rCGMBI/G1CUnHAINIVycsVQbQC6cbtsvrdC/FUwZ8itm6xB57VzFw==
X-Received: by 2002:a1c:6a0a:0:b0:3cf:d64e:1cea with SMTP id
 f10-20020a1c6a0a000000b003cfd64e1ceamr30318167wmc.183.1669801740875; 
 Wed, 30 Nov 2022 01:49:00 -0800 (PST)
Received: from [192.168.8.102] (tmo-073-221.customers.d1-online.com.
 [80.187.73.221]) by smtp.gmail.com with ESMTPSA id
 h40-20020a05600c49a800b003b3365b38f9sm1315208wmp.10.2022.11.30.01.48.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 01:49:00 -0800 (PST)
Message-ID: <0353754c-9cd0-a27c-ece7-738530ce53ba@redhat.com>
Date: Wed, 30 Nov 2022 10:48:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [qemu-web PATCH v2] Add a blog post about zoned storage emulation
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>, Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 damien.lemoal@opensource.wdc.com, hare@suse.de, dmitry.fomichev@wdc.com
References: <20221128071822.4707-1-faithilikerun@gmail.com>
 <CAJSP0QVZqvyzja8EP4U-i6WwW-gA9YQ9RQt1Ect51a51JzGxtQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAJSP0QVZqvyzja8EP4U-i6WwW-gA9YQ9RQt1Ect51a51JzGxtQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.258, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 28/11/2022 22.13, Stefan Hajnoczi wrote:
> Cool, thanks for writing up your zoned block emulation work!
> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Thanks, I've pushed it now to the server:

  https://www.qemu.org/2022/11/17/zoned-emulation/

  Thomas



