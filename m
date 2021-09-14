Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B93E540A5E1
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 07:18:34 +0200 (CEST)
Received: from localhost ([::1]:33636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ0q1-000315-Au
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 01:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mQ0ox-0002KJ-L9
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 01:17:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mQ0ot-0000P0-72
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 01:17:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631596641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nGNCO7/qmUdMw6gxzwMagcGBO4jZr6TcmBho60PTX6U=;
 b=MWZwhoi7xoIY8DEnet4znaExfmnZH649fCmhdWwAaO78MEZF13AbJvAAC+XVzLreUDDazO
 USeTtxMLlOsbpr0dLT3+NacV7qU8ZVDdhaGS5TENgIaHynznqKLv+v/xAPmxBFItwRdocH
 dvMzGbatXJqmQymdjLWfJCSl21r7+vE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-SjDjY9mbOVS2LExXujeSpg-1; Tue, 14 Sep 2021 01:17:15 -0400
X-MC-Unique: SjDjY9mbOVS2LExXujeSpg-1
Received: by mail-wr1-f71.google.com with SMTP id
 z1-20020adfec81000000b0015b085dbde3so3480712wrn.14
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 22:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nGNCO7/qmUdMw6gxzwMagcGBO4jZr6TcmBho60PTX6U=;
 b=gOxUi5JnN26paWBHxgK1KP3AzhaCdSFCiRIdvHz0HZuu0ZuafYvzb5bwWxs7ALVVtn
 Ix27IHN8JzG8BXISvINqZkU2FbxVtrMaHPF4uSqOcj98djGtj/FXpYc+pfz6OVbxth+A
 kpJah8iyyqtiRFX0nK06p8KRVkDIUggRjdVL8ihe4sECTdYkeIjEyj7Lf4X6tsrzAf7q
 VbmH/0Y8w8mxvIMsvFqmERK3w0V3aMqk3byU4gtiTf2zq1Uq4ti02rK3Nd9JElh3ZL+P
 zHAKXmfSPL8nP3XvummSHPmHprpBt8OAt2NugS7GIqtfve6L/255UkQ+0dfh4/dTXf43
 /ouw==
X-Gm-Message-State: AOAM530QKkkfFMetf2O4jOZn7+ZCjEQ5OD+g/HhIf92gPe117S8UQkWl
 jTaVL6LU4JL9uV4UnpqbK1qmBlm9grdsZlCTFxaOojDNdijwBA+U9NnkA7dSqe+qhu9mc7yyZKl
 wf8n1CM5rniAqz6o=
X-Received: by 2002:a5d:4b0b:: with SMTP id v11mr16941888wrq.359.1631596633898; 
 Mon, 13 Sep 2021 22:17:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwK/0LAlUjplKNI0r/Wq6VYBYp78RFfhPHFvFGOg2WBQoyvJKmjj9YRQhm+AErCZhaSpBcOg==
X-Received: by 2002:a5d:4b0b:: with SMTP id v11mr16941868wrq.359.1631596633651; 
 Mon, 13 Sep 2021 22:17:13 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-144-112.46.114.pool.telefonica.de. [46.114.144.112])
 by smtp.gmail.com with ESMTPSA id j98sm9538831wrj.88.2021.09.13.22.17.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 22:17:13 -0700 (PDT)
Subject: Re: [qemu-web PATCH] Gemfile: Add webrick bundle dependency
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>
References: <20210913182927.1022862-1-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <9f52b00e-0189-8f44-96d4-cbb398c4514f@redhat.com>
Date: Tue, 14 Sep 2021 07:17:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210913182927.1022862-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/09/2021 20.29, Philippe Mathieu-Daudé wrote:
> Without the webrick bundle, jekyll fails to start:
> 
>    $ bundle exec jekyll serve
>    Ignoring ffi-1.11.1 because its extensions are not built. Try: gem pristine ffi --version 1.11.1
>    Configuration file: qemu-web/_config.yml
>                Source: qemu-web
>           Destination: qemu-web/_site
>     Incremental build: disabled. Enable with --incremental
>          Generating...
>           Jekyll Feed: Generating feed for posts
>                        done in 0.686 seconds.
>     Auto-regeneration: enabled for 'qemu-web'
>                        ------------------------------------------------
>          Jekyll 4.0.1   Please append `--trace` to the `serve` command
>                         for any additional information or backtrace.
>                        ------------------------------------------------
>    qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/commands/serve/servlet.rb:3:in `require': cannot load such file -- webrick (LoadError)
>            from qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/commands/serve/servlet.rb:3:in `<top (required)>'
>            from qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/commands/serve.rb:179:in `require_relative'
>            from qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/commands/serve.rb:179:in `setup'
>            from qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/commands/serve.rb:100:in `process'
>            from qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/command.rb:89:in `block in process_with_graceful_fail'
>            from qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/command.rb:89:in `each'
>            from qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/command.rb:89:in `process_with_graceful_fail'
>            from qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/lib/jekyll/commands/serve.rb:86:in `block (2 levels) in init_with_program'
>            from qemu-web/vendor/ruby/3.0.0/gems/mercenary-0.3.6/lib/mercenary/command.rb:220:in `block in execute'
>            from qemu-web/vendor/ruby/3.0.0/gems/mercenary-0.3.6/lib/mercenary/command.rb:220:in `each'
>            from qemu-web/vendor/ruby/3.0.0/gems/mercenary-0.3.6/lib/mercenary/command.rb:220:in `execute'
>            from qemu-web/vendor/ruby/3.0.0/gems/mercenary-0.3.6/lib/mercenary/program.rb:42:in `go'
>            from qemu-web/vendor/ruby/3.0.0/gems/mercenary-0.3.6/lib/mercenary.rb:19:in `program'
>            from qemu-web/vendor/ruby/3.0.0/gems/jekyll-4.0.1/exe/jekyll:15:in `<top (required)>'
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   Gemfile | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Gemfile b/Gemfile
> index 6a7852e..dc35cb7 100644
> --- a/Gemfile
> +++ b/Gemfile
> @@ -25,3 +25,5 @@ end
>   
>   # for https://github.com/sass/sassc-ruby/issues/146
>   gem "sassc", ">= 2.2.1"
> +
> +gem "webrick", "~> 1.7"

Daniel, is this fixing the jekyll problem for you, too?

I'm still on ruby 2.5.9 where this does not occur yet... might be good to 
mention that this is a new problem with ruby 3.0 in the cover letter.

  Thomas



