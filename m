Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0E4327C94
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 11:50:09 +0100 (CET)
Received: from localhost ([::1]:40372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGg7s-0006Xv-Kp
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 05:50:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lGg6b-0005Ro-IH
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 05:48:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lGg6a-0001sF-1c
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 05:48:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614595727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AaIpbCsF58XY3xNVx9dchkXOJI43tiXMpft12gjeznU=;
 b=PMpez4Jy+qZ2dXNt3F6dH3xe1OzAajrlJOaeEEn1zw2TzQGiomv0pH8cyi9Bj3iMYIkGbm
 q+X7eRe03odjTARwcpQuHn7/U/KAnFJbsjz35z7iNctOkqZIEpIbwsciP/Iy+S9/EziWjN
 uFXVVm+yVoHyL5fQNe8jNmvdOuewc7k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-nTYEMToDNTCDxYY0SzMziQ-1; Mon, 01 Mar 2021 05:48:45 -0500
X-MC-Unique: nTYEMToDNTCDxYY0SzMziQ-1
Received: by mail-wm1-f72.google.com with SMTP id p8so5462386wmq.7
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 02:48:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AaIpbCsF58XY3xNVx9dchkXOJI43tiXMpft12gjeznU=;
 b=ONvuhEDcYM46DbEiVXIpdgIikocafJctXMfX3NZXjsnZp/ipVif/RzgvwuJH/UCXTL
 ZjifMKe48yCxpAjPsymQ1kFj5gq3mp3Orwe8T8Z/AVBr46OH6QnDgczLiXTqEDKt8pZp
 9/zF9r55Wu2KDuHAyymAsLK/czfo9Ddb5o91LuutuB+nxam0REF4BQG7fQXUTFs1Sf/X
 IlBtvdjgrFHAOCdOz1ToMxPuoG4YvsjpJbnaPwf3eC8xIsZf7fb3wYqX8sVeQ8ArI+Uj
 lxGer59HSLN0MNOCXOzgZh9JF5Dp0D+r1JB6kzG9WBFvI0pV3cXrD1b89AxeyZqaCJa9
 V9OA==
X-Gm-Message-State: AOAM530+vST5ISnnYadEMp8/SuxmiMO1BL0y+1+QNd6OWmTZLcI+g6IU
 nWQ4FmbaHIsvMlJgw1DRYY/8KAd88fe1qEKM7K6dkny9ktDfL5bNkj4X4OTCQXqZe9i8km8lZ/B
 9EznU9KeGkBePb1o=
X-Received: by 2002:a1c:1f94:: with SMTP id
 f142mr12906062wmf.180.1614595724688; 
 Mon, 01 Mar 2021 02:48:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwp4EPJr5FOsjlfESQG2y6Jeg9Uh/j73DcKTyQ5TgBpSKwBbxHVqxJ/1jcR/xQQBbfgZpvEUw==
X-Received: by 2002:a1c:1f94:: with SMTP id
 f142mr12906050wmf.180.1614595724484; 
 Mon, 01 Mar 2021 02:48:44 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id y10sm16206294wrl.19.2021.03.01.02.48.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 02:48:43 -0800 (PST)
Subject: Re: [PATCH 3/3] docs: vhost-user: replace master/slave with
 front-end/back-end
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20210226143413.188046-1-pbonzini@redhat.com>
 <20210226143413.188046-4-pbonzini@redhat.com>
 <YDzArmIIkO1GHoIz@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <77fda1e7-c26b-3c45-d840-0600b4455d01@redhat.com>
Date: Mon, 1 Mar 2021 11:48:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YDzArmIIkO1GHoIz@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
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
Cc: mst@redhat.com, jag.raman@oracle.com, qemu-devel@nongnu.org,
 sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/03/21 11:23, Stefan Hajnoczi wrote:
> The spec uses "backend" but this patch uses "back-end".
> 
> Searching the web shows that "back end", "back-end", and "backend" are
> all commonly used. I don't think there is a right or wrong choice since
> all spellings are popular. It would be nice to stay consistent and use
> "backend"/"frontend" in this document.

Ok, will fix in v2.

Paolo


