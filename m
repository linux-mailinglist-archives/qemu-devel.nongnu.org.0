Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBA12CA756
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 16:43:57 +0100 (CET)
Received: from localhost ([::1]:60730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk7oq-0003pj-IY
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 10:43:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk7ng-0003Io-QS
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:42:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk7nb-0002ag-Fx
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:42:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606837358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/1ryuTR31lHpA8WYDkF0absAkwcZH1cY0GkEVAo4FmQ=;
 b=CAU0rA1urJGCMSyXcz/z7nM17g/eSbMzirvTMAGrhhCb+0h983CF47uoRGhiFI9IMJYrk4
 z3npas5l2ijLL51asWtj2Qjvo9kM+ECUo8WuPrqTIKFWhELbA6j+YlsWCqKCc060f6zprN
 hR8HZMQIgJcJHvTWfGYjBYrjhiXBRDI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-aFHGRfnwNpentZ-MUBZmug-1; Tue, 01 Dec 2020 10:42:37 -0500
X-MC-Unique: aFHGRfnwNpentZ-MUBZmug-1
Received: by mail-ej1-f71.google.com with SMTP id f2so1425775ejx.22
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 07:42:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/1ryuTR31lHpA8WYDkF0absAkwcZH1cY0GkEVAo4FmQ=;
 b=a7G9a/Vzgvc1AjGvnU19JumKKX/6X8jtTjVDLwTU+Pm6ZkuKgr36D3HFl4Ouk2f4L3
 Fs2+VxtVZ7lsCz6JHEdBVy0C8x+on8mpwm6ERdd0XxoFSVlUjgAeoKgUls6HTbiTp9rw
 AhH7DC1f4GyHsZmLOBiUNn0LUjSB064o1QBUBsW+SRHgV5K+dz5tXlVlMTSuYVEnBSxT
 b3W0U2XkginfHWpx1KPvszxe0m+bqo3eXnX0SOcWVvAgW8mHoeS5Vf07WsSYMJM/0BL1
 ahHajz7rAfPECccVKsKMZy9iLlW/m0aPQfxquKtVba/V2IAHuKiJBm0EGJ78Y6xmBk6X
 IoWw==
X-Gm-Message-State: AOAM533Sh9Pn9nH1DqBU4gmARKI5UwB7pgvxQKcoAXxN15WkQbP/CfNd
 loncD+pqC7CAS9oQa51TS5hTdnxMUXcXCm1CqRKAzIBhiQxEwW44M941DuVe6yQrKb4NqeKA9lP
 T4VgGCcR3Ff5QBMW9ydy/tYEAGNmdP/ATefRmM63tt46TKOSIO9k12yqKeHNXq1+0WRk=
X-Received: by 2002:a50:b761:: with SMTP id g88mr3589630ede.387.1606837355757; 
 Tue, 01 Dec 2020 07:42:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFim6yXmcPByGeJ7P8wrKTVuUTaXtUK2koNXTT/MMlJZLye8XY+Y0Nmbmwvt/h9KhknzBYMQ==
X-Received: by 2002:a50:b761:: with SMTP id g88mr3589608ede.387.1606837355558; 
 Tue, 01 Dec 2020 07:42:35 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id gf9sm78305ejb.18.2020.12.01.07.42.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 07:42:34 -0800 (PST)
Subject: Re: [PATCH] ide:atapi: check io_buffer_index in
 ide_atapi_cmd_reply_end
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201118142745.112579-1-ppandit@redhat.com>
 <204751s9-11np-413q-q3pr-3o6os86078@erqung.pbz>
 <492170b8-8056-bd65-5150-62c6e89cb3f0@redhat.com>
 <933np1s-8p4p-o74p-rp94-517r98nop2o6@erqung.pbz>
 <0fd8daa2-7ce3-0231-8b95-d498ce900c8e@redhat.com>
 <CAFEAcA80QONZVnvf_BVnvFtx7tRX9Zr+7KCCuLJy7wXwppF7gQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4e376269-5ef8-5560-dac1-734ccdddd419@redhat.com>
Date: Tue, 1 Dec 2020 16:42:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA80QONZVnvf_BVnvFtx7tRX9Zr+7KCCuLJy7wXwppF7gQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: John Snow <jsnow@redhat.com>, Wenxiang Qian <leonwxqian@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
 P J P <ppandit@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/12/20 16:30, Peter Maydell wrote:
> On Tue, 1 Dec 2020 at 15:28, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>> About reproducer, Michael asked about CVE-2020-24352 (ati_vga OOB in
>> ati_2d_blt) this morning. What happens to reproducers when a CVE is
>> assigned, but the bug is marked as "out of the QEMU security boundary"?
> 
> Also, why are we assigning CVEs for bugs we don't consider security bugs?

Sometimes CVEs are requested by other entities even before reaching the 
QEMU security mailing list.

Paolo


