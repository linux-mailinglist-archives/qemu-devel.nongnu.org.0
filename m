Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F042C33D3BB
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 13:21:04 +0100 (CET)
Received: from localhost ([::1]:39230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM8h6-0006HY-0n
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 08:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lM8dY-0004xS-Bo
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:17:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lM8dQ-0001yu-NS
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:17:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615897034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7FepruK1BqSCOimTcdo1CvMKgoO0QOFSXySpPmDsTic=;
 b=IS+lz7t4tuZ0VbxZuh0JF5qetbxL49ertKsB5hU3+hxKZTvLk03vwamgmGaxmUh6XIQvqI
 qRmenMSov24GYzHDcjgRRs879cPVuUX9IXh5i/JdYUSxCgddZCWcgQRg65tQeaKwNc4VgX
 qRzGWT9LkDyCXyfSUUIeFmG02My2D4o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-DlkoJItBNrSz-TkGm-tn4w-1; Tue, 16 Mar 2021 08:17:12 -0400
X-MC-Unique: DlkoJItBNrSz-TkGm-tn4w-1
Received: by mail-wm1-f72.google.com with SMTP id l16so5130124wmc.0
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 05:17:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7FepruK1BqSCOimTcdo1CvMKgoO0QOFSXySpPmDsTic=;
 b=W9YDazw51AdkikWROo2+690qHw/Srw35XVrMBaNnuUoMo85XaFpaQsCDzsNnZwgNSR
 qsPaRucL9f2nxMm6JuR3+QS7JNwkVMzhS8Qwe//9jHwoNywbLpvp0qf8x+WWiuomiPtY
 n6rXQ+U6k2MfFvQlRPfdvafNz0IPiYuAMYT3ZleLDmB4nAYP+UaJjpKhkcYC7sGzJrsE
 EjRqYhF/D/XV6A2XuRVGwCPbhFjgMQvqJNf1xs7h9Eojmbfee1jmyxOUndyFESDz6XSX
 DpMzCfZCvXt58ed8Vip/P3Jwzx+RxQpdfffFuuhS4uNHDMutxhFJBqv4/rtE7wsYcCnl
 MGMw==
X-Gm-Message-State: AOAM531Wv4VAn0xtnWMMlGsXxQpizrVTu8GGDh8dXyir9fxWmkFxegtQ
 lBd3vg8W+SAbMJ1+EeEcYo6kKuLV7Qk/9B8bFCVJChW8On4Ry9zvX3VqTjcVizMaL+fcGf/+kT5
 CHuxtud2tCdi2gvCDXA+zinONagjg/Z5IAx8XA9AKR06VL6E6+Ys1d3b96UERRFFEZ+M=
X-Received: by 2002:a1c:a543:: with SMTP id o64mr4449693wme.107.1615897031304; 
 Tue, 16 Mar 2021 05:17:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGjdsAVTDOFXQFkAMdWo1x/Bu1ti5EMs96Up0qjm+g8OE9PVNlTCsBtZssfSQNnyz/bNHrrg==
X-Received: by 2002:a1c:a543:: with SMTP id o64mr4449676wme.107.1615897031108; 
 Tue, 16 Mar 2021 05:17:11 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j20sm2780717wmp.30.2021.03.16.05.17.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 05:17:10 -0700 (PDT)
Subject: Re: [PULL v2 0/5] Meson version update
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210315173912.197857-1-pbonzini@redhat.com>
 <CAFEAcA-XrOsZnUmxTCA+YbaL3rXxLMMmW5-bXJkRc0h_7v2E+A@mail.gmail.com>
 <CAFEAcA8ku-32=G=Q9iFa41vLnT7+CfjWTmsyxXtvruQM2X7W=A@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <83d44779-e686-f4e5-fabc-daf7e3ff50cb@redhat.com>
Date: Tue, 16 Mar 2021 13:17:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8ku-32=G=Q9iFa41vLnT7+CfjWTmsyxXtvruQM2X7W=A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/03/21 11:59, Peter Maydell wrote:
> This kind of "breaks the build tree such that you can't
> just 'git reset' back to master" bug is irritating. Doesn't
> meson have an "is this the right version" check on the cached
> data it's loading out of the build tree ?

It does, but it doesn't expect a ModuleNotFoundError.  I'll fix this and 
open a pull request.

Paolo


