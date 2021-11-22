Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A54D7458F73
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 14:33:41 +0100 (CET)
Received: from localhost ([::1]:37480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp9S0-00046N-Ho
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 08:33:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mp9Ou-00036b-Ac
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 08:30:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mp9Oq-0000jr-2H
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 08:30:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637587822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jnxGFqe5phKzeEjM7YXCZEG2lP+PKtbG1hwl5x0Ef24=;
 b=H+M/u9asdNQsCCye7/OhiWHQiA0X3tcmVWRd710hd+ufWmfwBDq7FA35PqKKG1XKydDQEx
 A7ADU15QNnwOw00ebyKoBd/krKMqcJO1YC9UgPQTd7KoJOc6slqkTFpsLpz9XcVnSiRzdD
 5Os05z5lwL2T/UaPEzT7kkcgmHEUJzs=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-323-nqKepZWoP4SUFbJamFas3Q-1; Mon, 22 Nov 2021 08:30:20 -0500
X-MC-Unique: nqKepZWoP4SUFbJamFas3Q-1
Received: by mail-qt1-f197.google.com with SMTP id
 h20-20020ac85e14000000b002b2e9555bb1so10630375qtx.3
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 05:30:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jnxGFqe5phKzeEjM7YXCZEG2lP+PKtbG1hwl5x0Ef24=;
 b=tKpqWBja4xhYHbqkikZpn24DWmu9O/8XJHH3tB5h7i5hNRJZ7W45OY6AjuqnlgeRDr
 XDB1r53yqCgCnMcDQWqzOFgjJd96taHX1WzmROsserjQbz5OLQm/OI5hS+dOtTOTgQ7q
 47IuPEFaCTa3qSYUSgNKYUetMxRp9oJPIu6SBVBxLZnJDQMd6DQrQuaWAuNgmIi/G8/a
 X1kCawHSaGAE+OFCVXeH+PLzMUEmxcxZ75O7/Y3ZZmK5RUfZJfAYloJh/0g8JewPb3eB
 NHSt9U4yGjzP++KWs6rHIPKTVqBQqbU8g9B481XbIg9l/IvAluLzh36/0URBCKdwoIUX
 aCtA==
X-Gm-Message-State: AOAM532npe2yFL/DyNhUO+U44xdIxZySUF4SWgVj8JSWpJ1AU+fEGIgd
 Iaw+ukC9KDWd1lbU/+spknYPGBnHYVLWYs/8Xi1sIVETxOYnKgkDuVEn+Txs4pvYXAdmzCfdkID
 hGEzFoRtBQsH1tao=
X-Received: by 2002:a05:6214:2a84:: with SMTP id
 jr4mr99223077qvb.35.1637587820239; 
 Mon, 22 Nov 2021 05:30:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyeiAcKSLAeES8a/SrcF5Egxjg2LfFW0mHYFNaQaZkgTS55Fc72iQv3prllY7mnfofdM4+jQA==
X-Received: by 2002:a05:6214:2a84:: with SMTP id
 jr4mr99223051qvb.35.1637587820079; 
 Mon, 22 Nov 2021 05:30:20 -0800 (PST)
Received: from [192.168.8.100] (tmo-097-143.customers.d1-online.com.
 [80.187.97.143])
 by smtp.gmail.com with ESMTPSA id i7sm4766804qkn.0.2021.11.22.05.30.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 05:30:19 -0800 (PST)
Message-ID: <ef4ff222-1053-904a-77c2-39adc9dd929a@redhat.com>
Date: Mon, 22 Nov 2021 14:30:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/2] docs: Fix botched rST conversion of
 'submitting-a-patch.rst'
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211119193118.949698-1-kchamart@redhat.com>
 <20211119193118.949698-2-kchamart@redhat.com>
 <56026d2a-0b9e-ff83-d953-a284a810a8ed@redhat.com> <YZtu59t8DoZZ15nQ@paraplu>
 <b03ffb0c-0c4f-b792-f6c1-55014a0ae003@redhat.com> <YZuK09xP0I28dvMr@paraplu>
 <c591c571-f922-28a5-e8be-75e6cccb261a@redhat.com>
 <CAFEAcA8QuSsazUZU23DJgXHhU=ez948wQFJkHZGRYWxhiXbuDg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA8QuSsazUZU23DJgXHhU=ez948wQFJkHZGRYWxhiXbuDg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, Laurent Vivier <Laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/11/2021 14.25, Peter Maydell wrote:
> On Mon, 22 Nov 2021 at 12:37, Thomas Huth <thuth@redhat.com> wrote:
>> What about simply replacing it with a new sentence below the bullet list,
>> saying:
>>
>> "Please also use a spell checker like `codespell
>> https://github.com/codespell-project/codespell` with your patches"
> 
> How many regular contributors actually do that?

Considering the typos that we have in the code, not enough ;-)

Anyway, it's just a polite recommendation here, not a must-do, so mentioning 
codespell here doesn't really hurt, does it?

  Thomas


