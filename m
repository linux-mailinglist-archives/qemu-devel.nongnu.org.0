Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4AB3A83BA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 17:13:21 +0200 (CEST)
Received: from localhost ([::1]:38774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltAki-0004zr-FI
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 11:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ltAjc-000472-Ek
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:12:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ltAja-0001He-Nz
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:12:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623769930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sTgogqeojHKzKK/lZ7rY61/ArRf9ALesOUFfwjR2Huo=;
 b=eNFttZQ1IFIsNAdIqQuzZnVwhiHRlJzDJxvA3VwckvmOS0tAXP33D7rK5QSPlF0aoCFKpL
 4J5cWsqI50mh6QxdwsSWrhEzMzR+GLLcVrn3SAF59mzTolaoNnITIahs3yBlB/wAh5NYMs
 sCt+BMk3KOCFhL0fCZH6YA7otEbIhZU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-xuHGrdEKPdyKqZa9gDageg-1; Tue, 15 Jun 2021 11:12:07 -0400
X-MC-Unique: xuHGrdEKPdyKqZa9gDageg-1
Received: by mail-ed1-f69.google.com with SMTP id
 y16-20020a0564024410b0290394293f6816so5083718eda.20
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 08:12:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sTgogqeojHKzKK/lZ7rY61/ArRf9ALesOUFfwjR2Huo=;
 b=rwtc86QKMaxGztMiVkEE+QUG8kt+nr3C4CVxA+KNUvuUAGfmN/iXwK6OYF6NZGuupy
 Myi95nf3Eo2Sk+wPLpJRzTt42MCuul74KYx5Vak+255MGd4b16X4GRVjxtCAxtS47Ti3
 1xLjfUAghNGBnMkva3YCYOjCrbO/PYe7fYwr4PEEzOR7K8dox4cf5zRKNRPf9nuC4Oey
 m3c2C69KQCrUuH2GdDvPHWTclwogFtKlVKG55GAM0egipA00wgkSOwrnDGpU2e7DIka4
 olY0W0tBCn/oABYo8l+NZ2/wpbYIn1Pk30OhcR3xjbPzumkelooT0I1CdFlDWBQcUea1
 emwQ==
X-Gm-Message-State: AOAM533oVhzX9nYyNNkfg33TkLrYH1kIGRAhn1YvdZs3VHZOQBVy7xqw
 TYN/n3dTfa2r5qoyI0GLvnNc77Knnet+Mq4MvhYAGg2cMrfE1joMzKvY1FyOmnPPfcwObzE/+1v
 9Wg1nX5T6MUbu2AzXoCj1dfDV5Hm5pYw0RQdNV591vt5Qisrp8NxviDk9W+MORL7RYW4=
X-Received: by 2002:a17:906:c1d0:: with SMTP id
 bw16mr23585ejb.146.1623769926305; 
 Tue, 15 Jun 2021 08:12:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSICFei0l8wsf56643eTu31ds7wUlRV6mPEvLVWiG7E9M6wkAwewVx2KgSTSc1uBebfl/PbA==
X-Received: by 2002:a17:906:c1d0:: with SMTP id
 bw16mr23545ejb.146.1623769925980; 
 Tue, 15 Jun 2021 08:12:05 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ck3sm12539865edb.56.2021.06.15.08.12.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 08:12:05 -0700 (PDT)
Subject: Re: [PATCH 09/26] configure, meson: convert vte detection to meson
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
 <20210608112301.402434-10-pbonzini@redhat.com> <YMi4HunPKXQF0j79@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b8af1369-a2e5-a16e-cb5f-4f24eac389e9@redhat.com>
Date: Tue, 15 Jun 2021 17:12:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YMi4HunPKXQF0j79@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/06/21 16:24, Daniel P. Berrangé wrote:
>> +    if not get_option('vte').auto() or have_system
>> +      vte = dependency('vte-2.91', version: '>=0.32.0',
>> +                       method: 'pkg-config',
>> +                       required: get_option('vte'),
>> +                       kwargs: static_kwargs)
>> +      if not vte.found()
>> +        vte = dependency('vte-2.90', version: '>=0.32.0',
>> +                         method: 'pkg-config',
>> +                         required: get_option('vte'),
>> +                         kwargs: static_kwargs)
>> +      endif
> The old configure checks didn't have a version number How did you
> decide on 0.32 ?  This version number doesn't make a whole lot of
> sense to me in the way it is used.
> 
> vte changes from ABI 2.90 to 2.91 in release 0.37, so you'll never
> get a version less than that with vte-2.91 IIUC.
> 
> Meanwhile all our supported distros ship 2.91 API now AFAICT, so we
> don't need the 2.90 code at all.

It did:

> -    vteminversion="0.32.0"
> -    if $pkg_config --exists "vte-2.91"; then
> -      vtepackage="vte-2.91"
> -    else
> -      vtepackage="vte-2.90"
> -    fi
> -    if $pkg_config --exists "$vtepackage >= $vteminversion"; then

but I will remove the check if that's doable.

Paolo


