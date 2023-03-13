Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8EF6B7890
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 14:12:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbhxd-0001CL-7G; Mon, 13 Mar 2023 09:11:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbassey@redhat.com>)
 id 1pbhxZ-00018Z-4o
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 09:11:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbassey@redhat.com>)
 id 1pbhxX-0003dr-BF
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 09:11:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678713086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=futdehKznYx6YFHaLDugVyttncMFjLJUsuDfE+3+PGI=;
 b=BNnWcBkzvo+zbfR69ZjAZPfnCXYjNhU9487ATbhHXtWk0Plrdr/M4Xj0jrchDhsEClcyzt
 VtLtKOEYen1kibKefo5aM1b898pny58k7++kWU1Ukyc/grWiUSVsI14ZTCLAz6ksZqMPhV
 bpkzOZZa8fq7lavk4Oa6fFMF0bHq8hc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-6imhPoD4P6S40NI7ePYqvQ-1; Mon, 13 Mar 2023 09:11:23 -0400
X-MC-Unique: 6imhPoD4P6S40NI7ePYqvQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 e14-20020a05620a208e00b0074270b9960dso6483226qka.22
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 06:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678713083;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=futdehKznYx6YFHaLDugVyttncMFjLJUsuDfE+3+PGI=;
 b=izqQUsPp5Oi0D8zqXTT5FcuHUdD55+3fSe8vyUOHiAgfRI6lLmyEzPgtrEp+VsrdlV
 WXo6N1IgixmtdRciCvHDhYUVvsgXJiCWMlQhbuw0tK6uJvjLt46q/6WP8Ax/Vjbu76Sp
 kJ1hnLqJcylE6AHfC6CV+eZos520FvjGEAaK2T2c+xcy8skPKUvqscbTzWMEYt9Bz4Eg
 rHHIEauzCmj7pSaYEkWDEzN71m2kC7SzyjEt9pkYL9GuAb38MRZTjtPeFTrvC4DEZz2H
 A30T1XydWrwecZDazQ/XeUURxMGDbrLcg2W1XlQAK4M5s2C/KX/Mf0cDSy1PPDrGtilQ
 mM8g==
X-Gm-Message-State: AO0yUKWQSACCPJ/hjZqk0AKdDL5gOn3SHacVm2PpcXN6ImtnTwYWk4f9
 jz3mdtaqTfoK1aXr0VeeD7jPH0J6kbZyM3TCN6MFIay4kbmOsLIVf10a58MjgtD7qkFh8bbBvWT
 OYn81M+5RIDKPhlD8BE8TUDzo94TTVxE=
X-Received: by 2002:aed:27d8:0:b0:3bf:dc7e:9e42 with SMTP id
 m24-20020aed27d8000000b003bfdc7e9e42mr10305979qtg.10.1678713082779; 
 Mon, 13 Mar 2023 06:11:22 -0700 (PDT)
X-Google-Smtp-Source: AK7set+FrIuKcY+ZHKJWsftPhabq7+mhpaXOFoawyE7LPV3MD9VdOZ7La3jzN6Mr8oUp4SLB5kbUfHtRBcLkt5LgLTs=
X-Received: by 2002:aed:27d8:0:b0:3bf:dc7e:9e42 with SMTP id
 m24-20020aed27d8000000b003bfdc7e9e42mr10305969qtg.10.1678713082404; Mon, 13
 Mar 2023 06:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230306171020.381116-1-dbassey@redhat.com>
 <64425814-c379-ef8f-b217-11d47f9f3bab@t-online.de>
In-Reply-To: <64425814-c379-ef8f-b217-11d47f9f3bab@t-online.de>
From: Dorinda Bassey <dbassey@redhat.com>
Date: Mon, 13 Mar 2023 14:11:11 +0100
Message-ID: <CACzuRyyyt-L+iwFHOS3Tq5hQ9OToedyM79fmtKU3+X6KpUDSsw@mail.gmail.com>
Subject: Re: [PATCH v7] audio/pwaudio.c: Add Pipewire audio backend for QEMU
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 kraxel@redhat.com, armbru@redhat.com, qemu_oss@crudebyte.com, 
 pbonzini@redhat.com, wtaymans@redhat.com, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000f4f4de05f6c7d8eb"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dbassey@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

--000000000000f4f4de05f6c7d8eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Volker,


> To hear this,
> start QEMU with qemu-system-x86_64 -machine pcspk-audiodev=3Daudio0
> -device ich9-intel-hda -device hda-duplex,audiodev=3Daudio0 -audiodev
> pipewire,id=3Daudio0,out.mixing-engine=3Doff ...
>
I hear the clipped audio stream with these options. IMO, I don't think
memset is responsible for that behaviour, I still hear the harsh sound with
"-audiodev pa". I also tried using an alternative like:

@@ -117,7 +118,7 @@ playback_on_process(void *data)
     }

     if (avail =3D=3D 0) {
-        memset(p, 0, n_bytes);
+        p =3D g_malloc0(sizeof(n_bytes));
     } else {

The clipped audio issue is still persistent.

Thanks,
Dorinda.

On Sun, Mar 12, 2023 at 9:01=E2=80=AFAM Volker R=C3=BCmelin <vr_qemu@t-onli=
ne.de> wrote:

> > +/* output data processing function to read stuffs from the buffer */
> > +static void
> > +playback_on_process(void *data)
> > +{
> > +    PWVoice *v =3D (PWVoice *) data;
> > +    void *p;
> > +    struct pw_buffer *b;
> > +    struct spa_buffer *buf;
> > +    uint32_t n_frames, req, index, n_bytes;
> > +    int32_t avail;
> > +
> > +    if (!v->stream) {
> > +        return;
> > +    }
> > +
> > +    /* obtain a buffer to read from */
> > +    b =3D pw_stream_dequeue_buffer(v->stream);
> > +    if (b =3D=3D NULL) {
> > +        error_report("out of buffers: %s", strerror(errno));
> > +        return;
> > +    }
> > +
> > +    buf =3D b->buffer;
> > +    p =3D buf->datas[0].data;
> > +    if (p =3D=3D NULL) {
> > +        return;
> > +    }
> > +    req =3D b->requested * v->frame_size;
> > +    if (req =3D=3D 0) {
> > +        req =3D 4096 * v->frame_size;
> > +    }
> > +    n_frames =3D SPA_MIN(req, buf->datas[0].maxsize);
> > +    n_bytes =3D n_frames * v->frame_size;
> > +
> > +    /* get no of available bytes to read data from buffer */
> > +
> > +    avail =3D spa_ringbuffer_get_read_index(&v->ring, &index);
> > +
> > +    if (!v->enabled) {
> > +        avail =3D 0;
> > +    }
> > +
> > +    if (avail =3D=3D 0) {
> > +        memset(p, 0, n_bytes);
>
> memset() doesn't work for unsigned samples. For unsigned samples, a
> stream of zeros is silence with a DC offset. When Pipewire mixes this
> stream with another, the result is a clipped audio stream. To hear this,
> start QEMU with qemu-system-x86_64 -machine pcspk-audiodev=3Daudio0
> -device ich9-intel-hda -device hda-duplex,audiodev=3Daudio0 -audiodev
> pipewire,id=3Daudio0,out.mixing-engine=3Doff ... and start playback with =
the
> hda device.
>
> With best regards,
> Volker
>
> > +    } else {
> > +        if (avail < (int32_t) n_bytes) {
> > +            n_bytes =3D avail;
> > +        }
> > +
> > +        spa_ringbuffer_read_data(&v->ring,
> > +                                    v->buffer, RINGBUFFER_SIZE,
> > +                                    index & RINGBUFFER_MASK, p,
> n_bytes);
> > +
> > +        index +=3D n_bytes;
> > +        spa_ringbuffer_read_update(&v->ring, index);
> > +    }
> > +
> > +    buf->datas[0].chunk->offset =3D 0;
> > +    buf->datas[0].chunk->stride =3D v->frame_size;
> > +    buf->datas[0].chunk->size =3D n_bytes;
> > +
> > +    /* queue the buffer for playback */
> > +    pw_stream_queue_buffer(v->stream, b);
> > +}
> > +
> >
>
>

--000000000000f4f4de05f6c7d8eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Volker,</div><span class=3D"gmail-im"><div>=C2=A0<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>To hear thi=
s, <br>
start QEMU with qemu-system-x86_64 -machine pcspk-audiodev=3Daudio0 <br><sp=
an>
-device ich9-intel-hda -device hda-duplex,audiodev=3Daudio0 -audiodev <br><=
/span>
pipewire,id=3Daudio0,out.mixing-engine=3Doff ... </div></blockquote></span>=
<div>I
 hear the clipped audio stream with these options. IMO, I don&#39;t think=
=20
memset is responsible for that behaviour, I still hear the harsh sound=20
with &quot;-audiodev pa&quot;. I also tried using an alternative like:</div=
><div><br></div><div>@@ -117,7 +118,7 @@ playback_on_process(void *data)<br=
>=C2=A0 =C2=A0 =C2=A0}<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0if (avail =3D=3D 0)=
 {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(p, 0, n_bytes);<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0p =3D g_malloc0(sizeof(n_bytes));<br>=C2=A0 =C2=A0 =C2=A0}=
 else {</div><div><br></div><div>The clipped audio issue is still persisten=
t.</div><div><br></div><div>Thanks,</div><div>Dorinda.</div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Mar 12,=
 2023 at 9:01=E2=80=AFAM Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@=
t-online.de">vr_qemu@t-online.de</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">&gt; +/* output data processing function t=
o read stuffs from the buffer */<br>
&gt; +static void<br>
&gt; +playback_on_process(void *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 PWVoice *v =3D (PWVoice *) data;<br>
&gt; +=C2=A0 =C2=A0 void *p;<br>
&gt; +=C2=A0 =C2=A0 struct pw_buffer *b;<br>
&gt; +=C2=A0 =C2=A0 struct spa_buffer *buf;<br>
&gt; +=C2=A0 =C2=A0 uint32_t n_frames, req, index, n_bytes;<br>
&gt; +=C2=A0 =C2=A0 int32_t avail;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!v-&gt;stream) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* obtain a buffer to read from */<br>
&gt; +=C2=A0 =C2=A0 b =3D pw_stream_dequeue_buffer(v-&gt;stream);<br>
&gt; +=C2=A0 =C2=A0 if (b =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;out of buffers: %s&quo=
t;, strerror(errno));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 buf =3D b-&gt;buffer;<br>
&gt; +=C2=A0 =C2=A0 p =3D buf-&gt;datas[0].data;<br>
&gt; +=C2=A0 =C2=A0 if (p =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 req =3D b-&gt;requested * v-&gt;frame_size;<br>
&gt; +=C2=A0 =C2=A0 if (req =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 req =3D 4096 * v-&gt;frame_size;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 n_frames =3D SPA_MIN(req, buf-&gt;datas[0].maxsize);<br=
>
&gt; +=C2=A0 =C2=A0 n_bytes =3D n_frames * v-&gt;frame_size;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* get no of available bytes to read data from buffer *=
/<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 avail =3D spa_ringbuffer_get_read_index(&amp;v-&gt;ring=
, &amp;index);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!v-&gt;enabled) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 avail =3D 0;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (avail =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(p, 0, n_bytes);<br>
<br>
memset() doesn&#39;t work for unsigned samples. For unsigned samples, a <br=
>
stream of zeros is silence with a DC offset. When Pipewire mixes this <br>
stream with another, the result is a clipped audio stream. To hear this, <b=
r>
start QEMU with qemu-system-x86_64 -machine pcspk-audiodev=3Daudio0 <br>
-device ich9-intel-hda -device hda-duplex,audiodev=3Daudio0 -audiodev <br>
pipewire,id=3Daudio0,out.mixing-engine=3Doff ... and start playback with th=
e <br>
hda device.<br>
<br>
With best regards,<br>
Volker<br>
<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (avail &lt; (int32_t) n_bytes) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n_bytes =3D avail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_ringbuffer_read_data(&amp;v-&gt;ring,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;buffer, RING=
BUFFER_SIZE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 index &amp; RINGBU=
FFER_MASK, p, n_bytes);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 index +=3D n_bytes;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_ringbuffer_read_update(&amp;v-&gt;rin=
g, index);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 buf-&gt;datas[0].chunk-&gt;offset =3D 0;<br>
&gt; +=C2=A0 =C2=A0 buf-&gt;datas[0].chunk-&gt;stride =3D v-&gt;frame_size;=
<br>
&gt; +=C2=A0 =C2=A0 buf-&gt;datas[0].chunk-&gt;size =3D n_bytes;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* queue the buffer for playback */<br>
&gt; +=C2=A0 =C2=A0 pw_stream_queue_buffer(v-&gt;stream, b);<br>
&gt; +}<br>
&gt; +<br>
&gt;<br>
<br>
</blockquote></div>

--000000000000f4f4de05f6c7d8eb--


