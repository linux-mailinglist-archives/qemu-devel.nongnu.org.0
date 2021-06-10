Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3855F3A2EB0
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 16:54:45 +0200 (CEST)
Received: from localhost ([::1]:48750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrM4y-00016z-6f
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 10:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lrM2n-0006rv-TD
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:52:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lrM2m-0005lC-9B
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:52:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623336747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9s4Kawz//0p79MDxul7gNQcLtcOduaSzvYeuuELnEbM=;
 b=CUPFAHoNUIxord8XU0Tx0EJd4z1hySxKIdp0KfzjHfCTMRYthU2eYR5TzlAnRPDSXO6CEH
 sSa5/D2gQR4++Pu3LpVcTGy/HzY/u8v8/VPx7pdp5l1dNdUt5A0NceywrVNcg/Nr/GLpp5
 fStiof8y1atkcDeJvM0uHB+aqcGYtTg=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-oAQfwxsrNNej6Mt0tryn_w-1; Thu, 10 Jun 2021 10:52:26 -0400
X-MC-Unique: oAQfwxsrNNej6Mt0tryn_w-1
Received: by mail-oo1-f70.google.com with SMTP id
 l13-20020a4a350d0000b029024a622ceb18so1301188ooa.19
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 07:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9s4Kawz//0p79MDxul7gNQcLtcOduaSzvYeuuELnEbM=;
 b=diQroNKhaInfWHjCvXkA2offovJfl8GNUVR4KFN7XXAUl9gfiK/YarL5SZGglnsvZj
 zyu66GU6LDpb0agJ7AIYWdpXDQQPzIg06MxX6lAUmeZfpVaVKTuyDdAWEGJcTwBke818
 YcJxw9MPttwnrf2REKttO+MrfzMjD31E3sk+1wFvIQLD5YlhJVMLqHhuAl3a2HaMQ8I4
 0GSIfutXwJaJoc2l2NlWcTNkq1/vrM+blopWT1pBfqAwSQV9YP9JQAk5Iochh/v1JQPj
 3mjArZ7+/hg2FwOIgiRK9gCKiKIVM522is+WCid37CXfGQ/LiJl6Apjr6TAWaGIzVvbd
 c2xg==
X-Gm-Message-State: AOAM532hD8OsjYBlw3p+e6tfIYWxqH/QLNvT273qgkP7CoLrhcjfgy/S
 oegk1fggTzLW1njozP74lYXMrE3edMZEkUZQcuqouiOKd4Y371Yo4hJB+vhPcTLL9Ssl/PJ04jY
 C+nIS3VG/kJmKLOk=
X-Received: by 2002:a9d:6042:: with SMTP id v2mr2738285otj.170.1623336744996; 
 Thu, 10 Jun 2021 07:52:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxS/PeGYzzpMxndn1b9Wbbik6S66Dgk+zRkcKMm0BolYazDcMa8T2eydDBuuFbc6qilFr/9HA==
X-Received: by 2002:a9d:6042:: with SMTP id v2mr2738273otj.170.1623336744855; 
 Thu, 10 Jun 2021 07:52:24 -0700 (PDT)
Received: from [192.168.0.173] (ip68-102-25-99.ks.ok.cox.net. [68.102.25.99])
 by smtp.gmail.com with ESMTPSA id
 e19sm561434oiw.24.2021.06.10.07.52.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 07:52:24 -0700 (PDT)
Subject: Re: [PATCH 04/11] target/i386/cpu: Add missing 'qapi/error.h' header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210610064556.1421620-1-philmd@redhat.com>
 <20210610064556.1421620-5-philmd@redhat.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <a6002655-be38-39ae-f6ec-43f5aa52e0e0@redhat.com>
Date: Thu, 10 Jun 2021 09:52:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210610064556.1421620-5-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Eric Blake <eblake@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/10/21 1:45 AM, Philippe Mathieu-Daudé wrote:
> Commit 00b81053244 ("target-i386: Remove assert_no_error usage")
> forgot to add the "qapi/error.h", add it now.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>


Reviewed-by: Connor Kuehl <ckuehl@redhat.com>


